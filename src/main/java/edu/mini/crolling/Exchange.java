package edu.mini.crolling;

import java.io.IOException;
import java.net.URLEncoder;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class Exchange {
	
	public int getKRWUSD() {
		 String KRWUSD = "";
		 int result = 0;
		try {
			//String url = "https://m.dhlottery.co.kr/common.do?method=main";
			//String url = "https://finance.daum.net/exchanges";
			
			String url = "https://www.x-rates.com/calculator/?from=USD&to=KRW&amount=1";
			Document doc = (Document) Jsoup.connect(url).get();
			//Element L_no = doc.selectFirst("div.prizeresult");  //ex
			
			//Element L_no = doc.selectFirst("div.prizeresult");
			//Elements no_1 = doc.selectFirst("div.inputB");
			//Element L_no = doc.selectFirst("#labExchange");
			Element L_no = doc.selectFirst("div.ccOutputBx");
			String str = L_no.getElementsByClass("ccOutputRslt").text().toString().replaceAll(" ", "");
			
			int idx = str.indexOf("."); 
	    
	         KRWUSD = str.substring(0, idx).replaceAll(",","");
	         result = Integer.parseInt(KRWUSD);
		 
	}catch (IOException e) {
		// TODO: handle exception
	}catch(NumberFormatException e) {
		result = 0;
	}
		return result;

}
	
}
