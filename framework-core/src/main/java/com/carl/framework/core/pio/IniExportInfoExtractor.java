package com.carl.framework.core.pio;

import com.carl.framework.util.StringUtil;
import org.apache.shiro.config.Ini;
import org.springframework.util.ResourceUtils;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;

/**
 * <pre>
 *     [export]
 *     fileName=今日订单.xls
 *     column=create_time,price
 *     header=时间,金额
 *
 * </pre>
 *
 * @author Carl
 * @date 2016/12/24
 * 版权所有.(c)2016 - 2020. 卡尔工作室
 */
public class IniExportInfoExtractor implements ExportInfoExtractor {
    private Ini ini = new Ini();

    public IniExportInfoExtractor(Ini ini) {
        this.ini = ini;
    }

    public IniExportInfoExtractor(InputStream iniInputStream) {
        this.ini = new Ini();
        this.ini.load(iniInputStream);
    }

    public IniExportInfoExtractor(File file) {
        try {
            this.ini.load(new FileInputStream(file));
        } catch (FileNotFoundException e) {
            throw new RuntimeException(e);
        }
    }

    public IniExportInfoExtractor(String path) {
        try {
            //获取配置文件
            File file = ResourceUtils.getFile(path);
            this.ini.load(new FileInputStream(file));
        } catch (FileNotFoundException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public ExportRealInfo extract(String id) throws ExportRealInfoException {
        String pre = !StringUtil.isNull(id) ? id + "." : "";
        String name = ini.getSectionProperty("export", pre + "fileName");
        String column = ini.getSectionProperty("export", pre + "column");
        String header = ini.getSectionProperty("export", pre + "header");
        return new ExportRealInfo().setFileName(name)
                .setColumnName(column != null ? column.split(",") : null)
                .setHeaderName(header != null ? header.split(",") : null);
    }
}
