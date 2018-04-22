package com.css.util;

import com.css.entity.DeptJL;
import org.apache.poi.hssf.usermodel.*;
import org.apache.poi.hssf.util.Region;
import org.springframework.web.servlet.view.document.AbstractExcelView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.*;

public class JingLiExcel extends AbstractExcelView {
    private String excelName;

    public JingLiExcel(String excelName) {
        this.excelName = excelName;
    }

    protected void buildExcelDocument(Map<String, Object> model, HSSFWorkbook workbook,
                                      HttpServletRequest request, HttpServletResponse response) throws Exception {
        // 设置response方式,使执行此controller时候自动出现下载页面,而非直接使用excel打开
        response.setContentType("APPLICATION/OCTET-STREAM");
        response.setHeader("Content-Disposition", "attachment; filename=" + URLEncoder.encode(excelName, "UTF-8"));
        List sheets = (List) model.get("sheets");
        for (int i = 0; i < sheets.size(); i++) {
            createSheet(workbook, (String) sheets.get(i), (String[]) ((List) model.get("title")).get(i), (List) ((List) model.get("viewList")).get(i));
        }
    }

    private void createSheet(HSSFWorkbook workbook, String sheetName, String[] title, List dataList) {
        // 设置表头字体
        HSSFFont font = workbook.createFont();
        font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);//粗体显示

        HSSFCellStyle style = workbook.createCellStyle();
        style.setFont(font);

        // 产生Excel表头
        HSSFSheet sheet = workbook.createSheet(sheetName);
        HSSFRow header0 = sheet.createRow(0); // 第0行
        sheet.addMergedRegion(new Region(0, (short) 0, 0, (short) 4));
        style.setAlignment(HSSFCellStyle.ALIGN_CENTER);
        header0.createCell(0).setCellValue("监区警力报告表");
        header0.getCell(0).setCellStyle(style);
        // 产生标题列
        HSSFRow header = sheet.createRow(1); // 第0行
        for (int n = 0; n < title.length; n++) {
            header.createCell(n).setCellValue(title[n]);
        }

        for (int n = 0; n < title.length; n++) {
            header.getCell(n).setCellStyle(style);
            sheet.autoSizeColumn(n);
            sheet.setColumnWidth(n, 10 * 512);
            style.setAlignment(HSSFCellStyle.ALIGN_CENTER);
        }

        // 填充数据
        int rowNum = 2;
        for (Iterator<Map> iter = dataList.iterator(); iter.hasNext(); ) {

            Map deptJL = iter.next();
            HSSFRow row = sheet.createRow(rowNum++);

            for (int j = 0; j < title.length; j++) {

                // 此处需要调试 匹配对应字段
                if (j == 0) {
                    row.createCell(j).setCellValue(deptJL.get("deptID").toString());
                } else if (j == 1) {
                    row.createCell(j).setCellValue(deptJL.get("deptName").toString());
                } else if (j == 2) {
                    row.createCell(j).setCellValue(deptJL.get("planCount").toString());
                } else if (j == 3) {
                    row.createCell(j).setCellValue(deptJL.get("realCount").toString());
                } else if (j == 4) {
                    row.createCell(j).setCellValue(deptJL.get("percent").toString());
                } else {
                    row.createCell(j).setCellValue("else");
                }
            }
        }
    }
}

