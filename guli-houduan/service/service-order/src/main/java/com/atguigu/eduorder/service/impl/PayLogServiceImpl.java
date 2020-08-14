package com.atguigu.eduorder.service.impl;

import com.alibaba.fastjson.JSONObject;
import com.atguigu.commonutils.R;
import com.atguigu.eduorder.entity.Order;
import com.atguigu.eduorder.entity.PayLog;
import com.atguigu.eduorder.mapper.PayLogMapper;
import com.atguigu.eduorder.service.OrderService;
import com.atguigu.eduorder.service.PayLogService;
import com.atguigu.eduorder.utils.HttpClient;
import com.atguigu.servicebase.exceptionhandler.GuliException;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.github.wxpay.sdk.WXPayUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import java.math.BigDecimal;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * <p>
 * 支付日志表 服务实现类
 * </p>
 *
 * @author testjava
 * @since 2020-08-08
 */
@Service
public class PayLogServiceImpl extends ServiceImpl<PayLogMapper, PayLog> implements PayLogService {


    @Autowired
    private OrderService orderService;
    @Override
    public Map createNative(String orderNo) {
          try{
              QueryWrapper<Order> wrapper = new QueryWrapper<>();
              wrapper.eq("order_no",orderNo);
              Order order = orderService.getOne(wrapper);
              HashMap m = new HashMap();
              m.put("appid", "wx74862e0dfcf69954");
              m.put("mch_id", "1558950191");
              m.put("nonce_str", WXPayUtil.generateNonceStr());
              m.put("body", order.getCourseTitle());
              m.put("out_trade_no", orderNo);
              m.put("total_fee", order.getTotalFee().multiply(new BigDecimal("100")).longValue()+"");
              m.put("spbill_create_ip", "127.0.0.1");
              m.put("notify_url", "http://guli.shop/api/order/weixinPay/weixinNotify\n");
              m.put("trade_type", "NATIVE");

              HttpClient client = new HttpClient("https://api.mch.weixin.qq.com/pay/unifiedorder");
              client.setXmlParam(WXPayUtil.generateSignedXml(m,"T6m9iK73b0kn9g5v426MKfHQH7X8rKwb"));
              client.setHttps(true);
              client.post();

              String xml = client.getContent();
              Map<String, String> resultMap = WXPayUtil.xmlToMap(xml);
              HashMap map = new HashMap<>();
              map.put("out_trade_no", orderNo);
              map.put("course_id", order.getCourseId());
              map.put("total_fee", order.getTotalFee());
              map.put("result_code", resultMap.get("result_code"));
              map.put("code_url", resultMap.get("code_url"));
              return map;

          }catch (Exception e){
              e.printStackTrace();
              throw new GuliException(20001,"生成二维码失败");
          }
    }

    @Override
    public Map<String, String> queryPayStatus(String orderNo) {
        try{
            HashMap m = new HashMap<>();
            m.put("appid", "wx74862e0dfcf69954");
            m.put("mch_id", "1558950191");
            m.put("out_trade_no", orderNo);
            m.put("nonce_str", WXPayUtil.generateNonceStr());
            HttpClient client = new HttpClient("https://api.mch.weixin.qq.com/pay/orderquery");
            client.setXmlParam(WXPayUtil.generateSignedXml(m, "T6m9iK73b0kn9g5v426MKfHQH7X8rKwb"));
            client.setHttps(true);
            client.post();

            String xml = client.getContent();
            Map<String, String> resultMap = WXPayUtil.xmlToMap(xml);

            return resultMap;
        }catch (Exception e){
            e.printStackTrace();
            throw new GuliException(20001,"支付失败");
        }


    }

    @Override
    public void updateOrderStatus(Map<String, String> map) {
        String orderNo = map.get("out_trade_no");

        QueryWrapper<Order> wrapper = new QueryWrapper<>();
        wrapper.eq("order_no",orderNo);
        Order order = orderService.getOne(wrapper);

        if (order.getStatus().intValue()==1){return;}
        order.setStatus(1);
        orderService.updateById(order);

        PayLog payLog = new PayLog();
        payLog.setOrderNo(order.getOrderNo());//支付订单号
        payLog.setPayTime(new Date());
        payLog.setPayType(1);//支付类型
        payLog.setTotalFee(order.getTotalFee());//总金额(分)
        payLog.setTradeState(map.get("trade_state"));//支付状态
        payLog.setTransactionId(map.get("transaction_id"));
        payLog.setAttr(JSONObject.toJSONString(map));
        baseMapper.insert(payLog);
    }

}
