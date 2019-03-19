package com.cmeu.controller;


import com.alibaba.fastjson.JSON;
import com.cmeu.pojo.vo.*;

import com.cmeu.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.cmeu.pojo.Customer;
import com.cmeu.pojo.CustomerCategory;
import com.cmeu.pojo.vo.CustomerVo;
import com.cmeu.result.DataTable;
import com.cmeu.service.AnalyService;
import com.cmeu.service.CustomerService;
import util.Cluster;
import util.KMeansRun;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import static com.sun.tools.internal.xjc.reader.Ring.add;

@Controller
@RequestMapping("/custom")
public class CustomController {
	@Autowired
	CustomerService customerService;
    @Autowired
    AnalyService analyService;
	@Autowired
	private HttpServletRequest request;

    @RequestMapping("/analy")
    public ModelAndView analy() throws Exception {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("custom/analy");
        return modelAndView;
    }

	@RequestMapping(value = "/queryEchart", method = RequestMethod.POST)
	@ResponseBody
	public  List<EchartVo> queryEchart() throws Exception
	{
		List<AnalyVo> anlayVo = analyService.getAnlayVo();
		List<EchartVo> echartList=new ArrayList<>();
		for (AnalyVo anlay:anlayVo) {
			EchartVo echart=new EchartVo();
			echart.setName(anlay.getValue());
			echart.setValue(String.valueOf(anlay.getNumber()));
			echartList.add(echart);
		}
		return  echartList;
	}
	@RequestMapping("/queryEchart2")
	@ResponseBody
	public  List<echartsRaderVo> echarts(Model model){
		List<echartsRaderVo> list =new ArrayList<echartsRaderVo>();
		ArrayList<List<String>> temp = new ArrayList<>();
		ArrayList<float[]> dataSet = new ArrayList<float[]>();
		ArrayList<float[]> localArray = new ArrayList<float[]>();
		ArrayList<String> strings = new ArrayList<>();
		dataSet.add(new float[] { 1, 2, 3 ,1,5});
		dataSet.add(new float[] { 3, 3, 3 ,12,4});
		dataSet.add(new float[] { 3, 4, 4,6,7});
		dataSet.add(new float[] { 5, 6, 5,1,9});
		dataSet.add(new float[] { 8, 9, 6,1,1});
		dataSet.add(new float[] { 4, 5, 4,1,19});
		dataSet.add(new float[] { 6, 4, 2,3,9});
		dataSet.add(new float[] { 3, 9, 7,2,1});
		dataSet.add(new float[] { 5, 9, 8,10,1});
		dataSet.add(new float[] { 4, 2, 10,2,3});
		dataSet.add(new float[] { 1, 9, 12,9,1});
		dataSet.add(new float[] { 7, 8, 11,4,2});
		dataSet.add(new float[] { 7, 8, 4,2,1});
		KMeansRun kRun =new KMeansRun(5, dataSet);
		Set<Cluster> clusterSet = kRun.run();
		//这里把聚类完成的中心点
		for (Cluster cluster : clusterSet) {
			localArray.add(	cluster.getCenter().getlocalArray());
		}
		for (int o=0;o<5;o++){
			echartsRaderVo echartsRader = new echartsRaderVo("客户"+(o+1), localArray.get(o), "特点"+(o+1), 15,-5);
			list.add(echartsRader);
		}
		return  list;
	}

	@RequestMapping(value = "/queryAnaly", method = RequestMethod.POST)
	public @ResponseBody DataTable<AnalyVo> queryAnaly(String draw, String start, String length) throws Exception
	{
		System.out.println("/queryAnaly");
		List<AnalyVo> anlayVo = analyService.getAnlayVo();
		//声明一个datatable对象封装数据

		DataTable<AnalyVo> data = new DataTable<AnalyVo>();
		data.setDraw(Integer.parseInt(draw == null ? "0": draw) + 1);
		data.setRecordsTotal(5);
		data.setRecordsFiltered(5);
		data.setData(anlayVo);

		return data;
	}

	@RequestMapping("/control")
	public ModelAndView control() throws Exception {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("custom/control");
		return modelAndView;
	}

}
