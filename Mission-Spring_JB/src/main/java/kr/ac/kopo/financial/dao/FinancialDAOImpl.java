package kr.ac.kopo.financial.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.financial.vo.salesVO;

@Repository
public class FinancialDAOImpl implements FinancialDAO {

//	@Autowired
//	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public void getSalesReportDao(List<salesVO> salesList) {
		
		//List를 전달해서 프로시저로 insert
		
		
	}
	
	
	
	
	
}
