package com.cs.workdream.utils;

import java.sql.Date;

public class DateUtils {
    // java.util.Date -> java.sql.Date 변환
    public static java.sql.Date convertToSqlDate(java.util.Date date) {
        return (date != null) ? new java.sql.Date(date.getTime()) : null;
    }

    // java.sql.Date -> java.util.Date 변환
    public static java.util.Date convertToUtilDate(java.sql.Date date) {
        return (date != null) ? new java.util.Date(date.getTime()) : null;
    }
}
