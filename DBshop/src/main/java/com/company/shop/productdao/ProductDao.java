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

	// 게시판 전체 조회
	public List<ProductDto> productAll() {
		return sqlSession.selectList("com.shop.mybatis.productAll");
	}

	// 게시판 페이징
	public List<ProductDto> productPaging(Map<String, Integer> map) {
		return sqlSession.selectList("com.shop.mybatis.productPaging", map);
	}

	// 게시판 갯수
	public int productCount() {
		return sqlSession.selectOne("com.shop.mybatis.productCount");
	}

	// 게시판 조회용, 수정 할 떄 조회
	public List<ProductDto> productSelect(int productNum) {
		return sqlSession.selectList("com.shop.mybatis.productSelect", productNum);
	}

	// 종류별 조회
	public List<ProductDto> productSelectKind(String kind) {
		return sqlSession.selectList("com.shop.mybatis.productSelectKind", kind);
	}

	// 검색
	public List<ProductDto> productSearch(String insertText) {
		return sqlSession.selectList("com.shop.mybatis.productSelect", insertText);
	}

	// 조회수
	public void productHit(int productNum) {
		sqlSession.update("com.shop.mybatis.productHit", productNum);
	}

	// 입력
	public void productWriteProc(Map<String, String> map) {
		sqlSession.insert("com.shop.mybatis.productWriteProc", map);
	}

	// 삭제
	public void productDelete(int productNum) {
		sqlSession.delete("com.shop.mybatis.productDelete", productNum);
	}

	// 수정
	public void productUpdateProc(Map<String, String> map) {
		sqlSession.update("com.shop.mybatis.productUpdateProc", map);
	}
	//주문 시 상품 조회
	public List<ProductDto> readProduct(int productNum) {
		return sqlSession.selectList("com.shop.mybatis.readProduct", productNum);
	}
}
