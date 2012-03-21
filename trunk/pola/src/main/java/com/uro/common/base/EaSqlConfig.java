package com.uro.common.base;

import java.io.Reader;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

public class EaSqlConfig {
	private static final SqlMapClient sqlMap;
	static {
		try {
			String resource = "sqlMap-config.xml" ;
			Reader reader = Resources.getResourceAsReader (resource);
			sqlMap = SqlMapClientBuilder.buildSqlMapClient(reader);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException (e);
		}
	}
	public static SqlMapClient getSqlMapInstance () {
		return sqlMap;
	}
}