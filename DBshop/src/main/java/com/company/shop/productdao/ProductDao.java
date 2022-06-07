package com.company.shop.productdao;

import java.sql.ResultSet;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.company.shop.productbean.ProductDto;

@Repository
public class ProductDao {

	@Autowired
	private SqlSession sqlSession;

	ResultSet rs = null;

	// �Խ��� ��ü ��ȸ
	public List<ProductDto> productAll() {
		return sqlSession.selectList("com.shop.mybatis.productAll");
	}

	// �Խ��� ����¡
	public List<ProductDto> productPaging(Map<String, Integer> map) {
		return sqlSession.selectList("com.shop.mybatis.productPaging", map);
	}

	// �Խ��� ����
	public int productCount() {
		return sqlSession.selectOne("com.shop.mybatis.productCount");
	}

	// �Խ��� ��ȸ��, ���� �� �� ��ȸ
	public List<ProductDto> productSelect(int productNum) {
		return sqlSession.selectList("com.shop.mybatis.productSelect", productNum);
	}

	// ������ ��ȸ
	public List<ProductDto> productSelectKind(String kind) {
		return sqlSession.selectList("com.shop.mybatis.productSelectKind", kind);
	}

	// �˻�
	public List<ProductDto> productSearch(String insertText) {
		return sqlSession.selectList("com.shop.mybatis.productSelect", insertText);
	}

	// ��ȸ��
	public void productHit(int productNum) {
		sqlSession.update("com.shop.mybatis.productHit", productNum);
	}

	// �Է�
	public void productWriteProc(Map<String, String> map) {
		sqlSession.insert("com.shop.mybatis.productWriteProc", map);
	}

	// ����
	public void productDelete(int productNum) {
		sqlSession.delete("com.shop.mybatis.productDelete", productNum);
	}

	// ����
	public void productUpdateProc(Map<String, String> map) {
		sqlSession.update("com.shop.mybatis.productUpdateProc", map);
	}
	//�ֹ� �� ��ǰ ��ȸ
	public List<ProductDto> readProduct(int productNum) {
		return sqlSession.selectList("com.shop.mybatis.readProduct", productNum);
	}
}
