package com.css.util;

import com.css.entity.DMinfo;
import com.css.entity.EmpInfo;
import org.apache.poi.hssf.usermodel.*;
import org.apache.poi.hssf.util.Region;
import org.springframework.web.servlet.view.document.AbstractExcelView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by wang on 7/14 0014.
 */
public class ViewExcel extends AbstractExcelView {
    private String excelName;

    public ViewExcel(String excelName) {
        this.excelName = excelName;
    }

    protected void buildExcelDocument(Map<String, Object> model, org.apache.poi.hssf.usermodel.HSSFWorkbook workbook, HttpServletRequest request, HttpServletResponse response) throws Exception {
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
        //获取前一天的当前时间
        SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd");
        Date date = new Date();
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        calendar.add(Calendar.DAY_OF_MONTH, -1);
        date = calendar.getTime();
        String nowTime = f.format(date);

        // 产生Excel表头
        HSSFSheet sheet = workbook.createSheet(sheetName);
        HSSFRow header0 = sheet.createRow(0); // 第0行
        style.setAlignment(HSSFCellStyle.ALIGN_CENTER);
        header0.createCell(0).setCellValue("点名报告表("+nowTime+")");
        header0.getCell(0).setCellStyle(style);
        sheet.addMergedRegion(new Region(0,(short)0,0,(short)1));
        // 产生标题列
        HSSFRow header = sheet.createRow(1); // 第0行
        for (int n = 0; n < title.length; n++) {
            header.createCell(n).setCellValue(title[n]);
        }


        for (int n = 0; n < title.length; n++) {

            header.getCell(n).setCellStyle(style);
            sheet.autoSizeColumn(n);
            sheet.setColumnWidth(n, 10 * 512);
        }

        // 填充数据
        int rowNum = 2;
        for (Iterator<DMinfo> iter = dataList.iterator(); iter.hasNext(); ) {

            DMinfo element = (DMinfo) iter.next();
            HSSFRow row = sheet.createRow(rowNum++);


            for (int j = 0; j < title.length; j++) {

                // 此处需要调试 匹配对应字段
                if (j == 0) {

                    row.createCell(j).setCellValue(element.getName());

                } else if (j == 1) {

                    row.createCell(j).setCellValue(element.getPcount());

                } else {
                    row.createCell(j).setCellValue("else");

                }
            }
        }
    }
}
