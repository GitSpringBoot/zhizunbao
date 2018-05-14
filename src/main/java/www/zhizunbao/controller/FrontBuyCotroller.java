package www.zhizunbao.controller;

import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import www.zhizunbao.dto.activity.UserDiscounts;
import www.zhizunbao.dto.insure.Insure;
import www.zhizunbao.dto.insure.UserInsure;
import www.zhizunbao.dto.manage.UserInfo;
import www.zhizunbao.service.InsureService;
import www.zhizunbao.service.UserInfoService;
import www.zhizunbao.utils.PaymentUtil;
import www.zhizunbao.utils.StringUtils;

@Controller
@RequestMapping("/frontBuy/")
public class FrontBuyCotroller {
	
	@Autowired
	private InsureService insureService;
	@Autowired
	private UserInfoService userInfoService;
	/**
	 * 
	 * Mr吴  2018年4月23日 下午6:54:01
	 * 功能 ：跳转健康告知页面
	 * @param request
	 * @param insureId
	 * @return
	 */
	@RequestMapping("toBuyOne")
	public String toBuyOne(HttpServletRequest request,Integer insureId){
		Insure insure = insureService.findInsureByInsureId(insureId);
		request.setAttribute("insure", insure);
		return "front/insure/insure_buy_01";
	}
	
	/**
	 * 
	 * Mr吴  2018年4月23日 下午6:54:05
	 * 功能 ：跳转填写保单页面
	 * @param request
	 * @param insureId
	 * @return
	 */
	@RequestMapping("toBuyTwo")
	public String toBuyTwo(HttpServletRequest request,Insure insure){
		return "front/insure/insure_buy_02";
	}
	
	/**
	 * 
	 * Mr吴  2018年4月23日 下午6:55:03
	 * 功能 ：跳转保单确认页面
	 * @return
	 */
	@RequestMapping("toBuyThree")
	public String toBuyThree(HttpServletRequest request,Insure insure,UserInfo userInfo){
		UserInfo user1 = (UserInfo) request.getSession().getAttribute("userInfo1");
		userInfo.setUserId(user1.getUserId());
		userInfoService.updateUserInfo(userInfo);
		UserInfo userInfo2 = userInfoService.findUserInfoBuId(userInfo.getUserId());
		request.getSession().setAttribute("userInfo1", userInfo2);
		Insure insure1 = insureService.findInsureInformationByInsureId(insure.getInsureId());
		List<UserDiscounts> userDiscounts = insureService.findUserDiscountsListByUserId(user1.getUserId());
		request.setAttribute("insure1", insure1);
		request.setAttribute("UserDiscounts", userDiscounts);
		return "front/insure/insure_buy_03";
	}
	/**
	 * 
	 * Mr吴  2018年4月24日 下午2:05:31
	 * 功能 ：跳转购买页面
	 * @param request
	 * @param insure
	 * @return
	 */
	@RequestMapping("toPay")
	public String toPay(HttpServletRequest request,Integer insureId,Integer id){
		Insure insure = insureService.findInsureByInsureId(insureId);
		UserDiscounts userDiscounts = userInfoService.findUserDiscountsById(id);
		request.setAttribute("insure", insure);
		request.setAttribute("userDiscounts", userDiscounts);
		return "front/insure/userInfo_pay";
	}
	
	/**
	 * 
	 * Mr吴  2018年4月24日 下午2:05:48
	 * 功能 ：易宝支付，订单生成
	 * @param request
	 * @param insure
	 * @param pd_FrpId
	 * @return
	 * @throws UnsupportedEncodingException
	 */
	@RequestMapping("pay")
	public String pay(HttpServletRequest request,Insure insure,String pd_FrpId,Integer id) throws UnsupportedEncodingException{
		Insure insure2 = insureService.findInsureByInsureId(insure.getInsureId());
		String uuid = StringUtils.getUUID();
		UserInsure userInsure = new UserInsure();
		userInsure.setInsureId(insure2.getInsureId());
		userInsure.setOrderId(uuid);
		userInsure.setInsureStatus(1);
		UserInfo user1 = (UserInfo) request.getSession().getAttribute("userInfo1");
		userInsure.setUserId(user1.getUserId());
		
		userInfoService.addUserInsure(userInsure);
		userInfoService.deleteUserDisById(id);
		request.setAttribute("uuid", uuid);
		UserInfo userInfo = (UserInfo) request.getSession().getAttribute("userInfo1");
		userInfoService.updateMsgUp(userInfo.getUserId());
		UserInfo userInfo2 = userInfoService.findUserInfoBuId(userInfo.getUserId());
		request.getSession().setAttribute("userInfo1", userInfo2);
		 //测试商户：商户编号  
        String accountID = "10001126856";  
        //测试商户：密钥  
        String keyValue = "69cl522AV6q613Ii4W6u8K6XuW8vM1N6bFgyv769220IuYe9u37N4y7rI4Pl";  
        //测试商户：商户接收支付成功数据的地址  
       /* String accountCallbackURL = "http://10.1.4.50:8080/pay3/servlet/yeepay/PaymentResultServlet";  */
        String accountCallbackURL =request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/frontBuy/result";  
          
        String orderID = uuid;       //获取订单号  
        String amount = "0.01";         //获取支付金额  
        String accountBankID = pd_FrpId; //获取用户所选择的银行  
        String businessType = "Buy";  //业务类型。Buy为在线支付  
        String currency = "CNY";      //交易币种。CNY为人民币  
        String productDesc = "";      //商品描述  
        String productCategory = "";  //商品种类  
        String productID = insure2.getInsureId().toString();        //商品ID  
        String addressFlag = "0";     //送货地址。0为不需要，1为需要  
        String accountMoreInfo = "";  //商户扩展信息  
        String pr_NeedResponse = "0"; //应答机制  
          
        String md5hmac = PaymentUtil.buildHmac(  
                businessType, accountID, orderID, amount, currency, productID, productCategory,  
                productDesc, accountCallbackURL, addressFlag, accountMoreInfo, accountBankID,  
                pr_NeedResponse, keyValue);  
          
        request.setAttribute("businessType", businessType);  
        request.setAttribute("accountID", accountID);  
        request.setAttribute("orderID", orderID);  
        request.setAttribute("amount", amount);  
        request.setAttribute("currency", currency);  
        request.setAttribute("productID", productID);  
        request.setAttribute("productCategory", productCategory);  
        request.setAttribute("productDesc", productDesc);  
        request.setAttribute("accountCallbackURL", accountCallbackURL);  
        request.setAttribute("addressFlag", addressFlag);  
        request.setAttribute("accountMoreInfo", accountMoreInfo);  
        request.setAttribute("accountBankID", accountBankID);  
        request.setAttribute("needResponse", pr_NeedResponse);  
        request.setAttribute("md5hmac", md5hmac);  	
		
		return "front/insure/conection";
	}
	
	/**
	 * 
	 * Mr吴  2018年4月24日 下午2:06:12
	 * 功能 ：支付
	 * @param request
	 * @return
	 * @throws UnsupportedEncodingException
	 */
	@RequestMapping("result")
	public String ResultPay(HttpServletRequest request) throws UnsupportedEncodingException{
		  /*request.setCharacterEncoding("GBK");  */
    	request.setCharacterEncoding("UTF-8");
        
        //测试商户：商家ID   
        String p1_MerId = "10001126856";  
        //测试商户：商家密钥  
        String keyValue = "69cl522AV6q613Ii4W6u8K6XuW8vM1N6bFgyv769220IuYe9u37N4y7rI4Pl";  
          
        String r0_Cmd = request.getParameter("r0_Cmd");      //业务类型  
        String r1_Code = request.getParameter("r1_Code");    //扣款结果。1:扣款成功  
        String r2_TrxId = request.getParameter("r2_TrxId");  //易宝交易订单号  
        String r3_Amt = request.getParameter("r3_Amt");      //扣款金额。交易结束后，易宝交易系统将实际扣款金额返回给商户  
        String r4_Cur = request.getParameter("r4_Cur");      //交易币种。人民币为CNY  
        String r5_Pid = request.getParameter("r5_Pid");      //商品ID  
        String r6_Order = request.getParameter("r6_Order");  //商户订单号  
        String r7_Uid = request.getParameter("r7_Uid");      //易宝会员ID  
        String r8_MP = request.getParameter("r8_MP");        //商户扩展信息。可任意填写1K的字符串，交易返回时将原样返回  
        String r9_BType = request.getParameter("r9_BType");  //交易结果通知类型。1:交易成功回调(浏览器重定向)，2:交易成功主动通知(服务器点对点通讯)  
        String hmac = request.getParameter("hmac");          //MD5交易签名  
          
        boolean result = PaymentUtil.verifyCallback(  
                hmac, p1_MerId, r0_Cmd, r1_Code, r2_TrxId, r3_Amt, r4_Cur,  
                r5_Pid, r6_Order, r7_Uid, r8_MP, r9_BType, keyValue);  
          
        if (result) {  
            if ("1".equals(r1_Code)) {  
                StringBuffer message = new StringBuffer();  
                message.append("订单号为：" + r6_Order + " 的订单支付成功，"); //此时数据库中订单支付状态应为已支付，否则容易出现"无限刷点卡"的BUG  
                message.append("用户支付了" + r3_Amt + "元。<br/>");  
               /* message.append("交易结果通知类型：");  
                if ("1".equals(r9_BType)) {  
                    message.append("浏览器重定向。<br/>");  
                } else if ("2".equals(r9_BType)) {  
                    message.append("易宝支付网关后台程序通知。<br/>");  
                } */ 
                message.append("易宝订单系统中的订单号为：" + r2_TrxId);  
                request.setAttribute("message", message); 
                UserInsure userInsure = new UserInsure();
                SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                String buytime = format.format(new Date());
                userInsure.setBuyTime(buytime);
                userInsure.setInsureStatus(2);
                userInsure.setBuyMoney(200);
                userInsure.setOrderId(r6_Order);
                userInfoService.updateUserInsureByOrderId(userInsure);
                
                insureService.updateInsureUp(Integer.parseInt(r5_Pid),request);
            } else {  
                request.setAttribute("message", "用户支付失败");  
            }  
        } else {  
            request.setAttribute("message", "数据来源不合法");  
        }  
          
		return "front/insure/paymentResult";
	}
	
	/**
	 * 
	 * Mr吴  2018年4月26日 下午5:49:23
	 * 功能 ：未支付订单重新支付
	 * @param request
	 * @param userInfo
	 * @return
	 */
	@RequestMapping("toBuyAgain")
	public String toBuyAgain(HttpServletRequest request,UserInfo userInfo){
		userInfo = userInfoService.findUserInsureById(userInfo.getId());
		Insure insure = new Insure();
		UserInsure userInsure = new UserInsure();
		insure.setInsureName(userInfo.getInsureName());
		insure.setInsurePrice(userInfo.getInsurePrice());
		insure.setInsureId(userInfo.getInsureId());
		userInsure.setInsureStatus(userInfo.getInsureStatus());
		userInsure.setId(userInfo.getId());
		request.setAttribute("insure", insure);
		request.setAttribute("userInsure", userInsure);
		return "front/insure/userInfo_pay_again";
	}
	
	/**
	 * 
	 * Mr吴  2018年4月24日 下午2:05:48
	 * 功能 ：未支付订单，重新购买购买
	 * @param request
	 * @param insure
	 * @param pd_FrpId
	 * @return
	 * @throws UnsupportedEncodingException
	 */
	@RequestMapping("payAgain")
	public String payAgain(HttpServletRequest request,UserInfo userInfo,String pd_FrpId) throws UnsupportedEncodingException{
		UserInfo userInfo2 = userInfoService.findUserInsureById(userInfo.getId());
		 //测试商户：商户编号  
        String accountID = "10001126856";  
        //测试商户：密钥  
        String keyValue = "69cl522AV6q613Ii4W6u8K6XuW8vM1N6bFgyv769220IuYe9u37N4y7rI4Pl";  
        //测试商户：商户接收支付成功数据的地址  
       /* String accountCallbackURL = "http://10.1.4.50:8080/pay3/servlet/yeepay/PaymentResultServlet";  */
        String accountCallbackURL =request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/frontBuy/result";  
          
        String orderID = userInfo2.getOrderId();       //获取订单号  
        String amount = "0.01";         //获取支付金额  
        String accountBankID = pd_FrpId; //获取用户所选择的银行  
        String businessType = "Buy";  //业务类型。Buy为在线支付  
        String currency = "CNY";      //交易币种。CNY为人民币  
        String productDesc = "";      //商品描述  
        String productCategory = "";  //商品种类  
        String productID = userInfo2.getInsureId().toString();        //商品ID  
        String addressFlag = "0";     //送货地址。0为不需要，1为需要  
        String accountMoreInfo = "";  //商户扩展信息  
        String pr_NeedResponse = "0"; //应答机制  
          
        String md5hmac = PaymentUtil.buildHmac(  
                businessType, accountID, orderID, amount, currency, productID, productCategory,  
                productDesc, accountCallbackURL, addressFlag, accountMoreInfo, accountBankID,  
                pr_NeedResponse, keyValue);  
          
        request.setAttribute("businessType", businessType);  
        request.setAttribute("accountID", accountID);  
        request.setAttribute("orderID", orderID);  
        request.setAttribute("amount", amount);  
        request.setAttribute("currency", currency);  
        request.setAttribute("productID", productID);  
        request.setAttribute("productCategory", productCategory);  
        request.setAttribute("productDesc", productDesc);  
        request.setAttribute("accountCallbackURL", accountCallbackURL);  
        request.setAttribute("addressFlag", addressFlag);  
        request.setAttribute("accountMoreInfo", accountMoreInfo);  
        request.setAttribute("accountBankID", accountBankID);  
        request.setAttribute("needResponse", pr_NeedResponse);  
        request.setAttribute("md5hmac", md5hmac);  	
		
		return "front/insure/conection";
	}
	
}
