package com.company.shop.orderdao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.company.shop.orderbean.OrderDto;

@Repository
public class OrderDao {

	@Autowired
	private SqlSession sqlSession;

	// 회원 주문조회
	public List<OrderDto> orderChk(String id) {
		return sqlSession.selectList("com.shop.mybatis.orderChk", id);
	}

	// 관리자 주문조회
	public List<OrderDto> delivery() {
		return sqlSession.selectList("com.shop.mybatis.delivery");
	}

	public List<OrderDto> deliveryOnly() {
		return sqlSession.selectList("com.shop.mybatis.deliveryOnly");
	}

	public List<OrderDto> deliveryReady() {
		return sqlSession.selectList("com.shop.mybatis.deliveryReady");
	}

	// 배송관리 배송으로 변경
	public int deliveryProc(int orderNum) {
		return sqlSession.update("com.shop.mybatis.deliveryProc", orderNum);
	}

	// 배송관리 배송준비중으로 변경
	public int deliveryCancelProc(int orderNum) {
		return sqlSession.update("com.shop.mybatis.deliveryCancelProc", orderNum);
	}

	// 배송관리 선택배송으로 변경
	public int deliverySelProc(int orderNum) {
		return sqlSession.update("com.shop.mybatis.deliveryProc", orderNum);
	}

	// 상품 주문
	public int insertOrder(Map<String, Object> map) {
		return sqlSession.insert("com.shop.mybatis.insertOrder", map);
	}

	public List<OrderDto> readOrder(int orderNum) {
		return sqlSession.selectList("com.shop.mybatis.readOrder", orderNum);
	}

}
