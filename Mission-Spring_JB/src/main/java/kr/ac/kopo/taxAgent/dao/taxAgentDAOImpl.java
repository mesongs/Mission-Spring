package kr.ac.kopo.taxAgent.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.taxAgent.service.TaxAgentService;
import kr.ac.kopo.taxAgent.vo.TaxCustomerVO;

@Repository
public class taxAgentDAOImpl implements TaxAgentDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public List<TaxCustomerVO> getCustomerListDao(String taxAgentId) {
		
		List<TaxCustomerVO> getCutomerList = sqlSessionTemplate.selectList("taxAgent.taxAgentDAO.getCustomerList", taxAgentId);
		
		return getCutomerList;
	}

	@Override
	public TaxCustomerVO getCustomerInfoDao(String bNo) {
		
		TaxCustomerVO taxCustomer = sqlSessionTemplate.selectOne("taxAgent.taxAgentDAO.getCustomerInfo", bNo);
		
		return taxCustomer;
	}

	
	
	
	
}
