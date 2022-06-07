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

	// ȸ�� �ֹ���ȸ
	public List<OrderDto> orderChk(String id) {
		return sqlSession.selectList("com.shop.mybatis.orderChk", id);
	}

	// ������ �ֹ���ȸ
	public List<OrderDto> delivery() {
		return sqlSession.selectList("com.shop.mybatis.delivery");
	}

	public List<OrderDto> deliveryOnly() {
		return sqlSession.selectList("com.shop.mybatis.deliveryOnly");
	}

	public List<OrderDto> deliveryReady() {
		return sqlSession.selectList("com.shop.mybatis.deliveryReady");
	}

	// ��۰��� ������� ����
	public int deliveryProc(int orderNum) {
		return sqlSession.update("com.shop.mybatis.deliveryProc", orderNum);
	}

	// ��۰��� ����غ������� ����
	public int deliveryCancelProc(int orderNum) {
		return sqlSession.update("com.shop.mybatis.deliveryCancelProc", orderNum);
	}

	// ��۰��� ���ù������ ����
	public int deliverySelProc(int orderNum) {
		return sqlSession.update("com.shop.mybatis.deliveryProc", orderNum);
	}

	// ��ǰ �ֹ�
	public int insertOrder(Map<String, Object> map) {
		return sqlSession.insert("com.shop.mybatis.insertOrder", map);
	}

	public List<OrderDto> readOrder(int orderNum) {
		return sqlSession.selectList("com.shop.mybatis.readOrder", orderNum);
	}

}
