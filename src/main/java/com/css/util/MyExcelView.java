package com.css.util;

import com.css.entity.EmpInfo;
import com.sun.tools.javac.util.List;
import org.apache.poi.ss.usermodel.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.net.URLEncoder;
import java.util.Map;

/**
 * Created by wang on 7/14 0014.
 */
public class MyExcelView extends MyAbstractExcelView {

    @Override
    protected void buildExcelDocument(Map<String, Object> model,
                                      Workbook workbook, HttpServletRequest request,
                                      HttpServletResponse response) throws Exception {

        // 设置response方式,使执行此controller时候自动出现下载页面,而非直接使用excel打开
        response.setContentType("APPLICATION/OCTET-STREAM");
        response.setHeader("Content-Disposition", "attachment; filename="+ URLEncoder.encode("中文", "UTF-8"));

        Sheet sheet = workbook.createSheet("中文");
        List<EmpInfo> employees = (List<EmpInfo>) model.get("viewList");

        Row row = null;
        Cell cell = null;
        int r = 0;
        int c = 0;

        //Style for header cell
        CellStyle style = workbook.createCellStyle();
//        style.setFillForegroundColor(IndexedColors.GREY_40_PERCENT.index);
        style.setFillForegroundColor(IndexedColors.GREY_40_PERCENT.getIndex());
        style.setFillPattern(CellStyle.SOLID_FOREGROUND);
        style.setAlignment(CellStyle.ALIGN_CENTER);

        //Create header cells
        row = sheet.createRow(r++);

        cell = row.createCell(c++);
        cell.setCellStyle(style);
        cell.setCellValue("Title");

        cell = row.createCell(c++);
        cell.setCellStyle(style);
        cell.setCellValue("URL");

        cell = row.createCell(c++);
        cell.setCellStyle(style);
        cell.setCellValue("Categories");

        cell = row.createCell(c++);
        cell.setCellStyle(style);
        cell.setCellValue("Tags");


        //Create data cell
        for(EmpInfo employee:employees){
            row = sheet.createRow(r++);
            c = 0;
            row.createCell(c++).setCellValue(employee.getEmpNo());
            row.createCell(c++).setCellValue(employee.getEmpName());
            row.createCell(c++).setCellValue(employee.getDeptName());
            row.createCell(c++).setCellValue(employee.getDeptNo());

        }
        for(int i = 0 ; i < 3; i++)
            sheet.autoSizeColumn(i, true);
    }

}
