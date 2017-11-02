package service.backend;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import pojo.Invest_type;

public interface Invest_typeService {
	
		//产品分类
		public List<Invest_type> getInvest_typeList(
						@Param(value="from")Integer currentPageNo,
						@Param(value="pageSize")Integer pageSize)throws Exception;
				
		public int count()throws Exception;
		
		//删除
		public boolean deleteInvest_typeById(Integer delId)throws Exception;
		//修改消息推送	
		public int modifyInvest_type(Invest_type invest_type)throws Exception;
		//添加
		public int addInvest_type(Invest_type invest_type) throws Exception;

}
