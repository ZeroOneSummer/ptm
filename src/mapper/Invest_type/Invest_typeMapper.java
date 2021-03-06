package mapper.Invest_type;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import pojo.Invest_type;
import pojo.Msg_push;



public interface Invest_typeMapper {
	
	//产品分类
	public List<Invest_type> getInvest_typeList(
					@Param(value="from")Integer currentPageNo,
					@Param(value="pageSize")Integer pageSize)throws Exception;
			
	public int count()throws Exception;
	
	//删除
	public int deleteInvest_typeById(@Param(value="id")Integer delId)throws Exception;
	//修改
	public int modifyInvest_type(Invest_type invest_type)throws Exception;
	//添加
	public int addInvest_type(Invest_type invest_type) throws Exception;
	
	//根据Id查找具体产品
	public Invest_type getInvest_typeById(@Param(value="id")Integer id) throws Exception;

}
