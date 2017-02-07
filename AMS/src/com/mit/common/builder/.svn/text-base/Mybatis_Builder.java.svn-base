package com.mit.common.builder;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.mybatis.generator.api.MyBatisGenerator;
import org.mybatis.generator.config.Configuration;
import org.mybatis.generator.config.xml.ConfigurationParser;
import org.mybatis.generator.exception.InvalidConfigurationException;
import org.mybatis.generator.exception.XMLParserException;
import org.mybatis.generator.internal.DefaultShellCallback;

public class Mybatis_Builder {

	public Mybatis_Builder() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * @param args
	 * @throws XMLParserException
	 * @throws IOException
	 * @throws InvalidConfigurationException
	 * @throws InterruptedException
	 * @throws SQLException
	 */
	public static void main1(String[] args) throws IOException,
			XMLParserException, InvalidConfigurationException, SQLException,
			InterruptedException {

		String path = Mybatis_Builder.class.getResource("/")
				+ "com/mit/common/builder/";
		path = path.substring(6);
		System.out.println(path);
		//
		List<String> warnings = new ArrayList<String>();
		boolean overwrite = true;
		File configFile = new File(path + "Generator.xml");
		ConfigurationParser cp = new ConfigurationParser(warnings);
		Configuration config = cp.parseConfiguration(configFile);
		DefaultShellCallback callback = new DefaultShellCallback(overwrite);
		MyBatisGenerator myBatisGenerator = new MyBatisGenerator(config,
				callback, warnings);
		myBatisGenerator.generate(null);

	}

	public static void main2(String[] args) {
		String cfgPath = "/com/mit/common/builder/Generator.xml";
		File file = new File(Mybatis_Builder.class.getResource(cfgPath)
				.getFile());
		if (!file.exists()) {
			System.out.println("file is not exist");
		} else {
			System.out.println(file.getAbsolutePath());
		}
		System.out.println(Mybatis_Builder.class.getResource(
				"/com/mit/common/builder/Generator.xml").getFile());
	}

	public static void main(String[] args) {
		List<String> warnings = new ArrayList<String>();
		boolean overwrite = true;
		// String genCfg = "/Generator.xml"; // src的一级目录下
		// File configFile = new File(Mybatis_Builder.class.getResource(genCfg)
		// .getFile());

		String genCfg = "/com/mit/common/builder/Generator.xml";
		File configFile = new File(Mybatis_Builder.class.getResource(genCfg)
				.getFile());
		// File configFile = new
		// File("D:/ylink/myeclipse/MBG/src/com/yuan/mybatis/mbg/util/generatorConfig.xml");
		ConfigurationParser cp = new ConfigurationParser(warnings);
		Configuration config = null;
		try {
			config = cp.parseConfiguration(configFile);
		} catch (IOException e) {
			e.printStackTrace();
		} catch (XMLParserException e) {
			e.printStackTrace();
		}
		DefaultShellCallback callback = new DefaultShellCallback(overwrite);
		MyBatisGenerator myBatisGenerator = null;
		try {
			myBatisGenerator = new MyBatisGenerator(config, callback, warnings);
		} catch (InvalidConfigurationException e) {
			e.printStackTrace();
		}
		try {
			myBatisGenerator.generate(null);
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
	}
}
