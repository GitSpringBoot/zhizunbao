package www.zhizunbao.mapper.manage;

import java.util.List;
import java.util.Map;

import www.zhizunbao.dto.manage.Resources;
import www.zhizunbao.dto.manage.ResourcesTree;

public interface ResourcesMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table resources
     *
     * @mbggenerated Tue Apr 17 22:45:22 CST 2018
     */
    int deleteByPrimaryKey(Integer resId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table resources
     *
     * @mbggenerated Tue Apr 17 22:45:22 CST 2018
     */
    int insert(Resources record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table resources
     *
     * @mbggenerated Tue Apr 17 22:45:22 CST 2018
     */
    int insertSelective(Resources record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table resources
     *
     * @mbggenerated Tue Apr 17 22:45:22 CST 2018
     */
    Resources selectByPrimaryKey(Integer resId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table resources
     *
     * @mbggenerated Tue Apr 17 22:45:22 CST 2018
     */
    int updateByPrimaryKeySelective(Resources record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table resources
     *
     * @mbggenerated Tue Apr 17 22:45:22 CST 2018
     */
    int updateByPrimaryKey(Resources record);
    
	List<Resources> findResourcesList();

	Resources findResourcesById(Integer res_id);

	//void updateResourcesById(Resources resources);

	//void deleteResourcesById(Integer res_id);

	void insertResourcesById(Resources resources);

	List<Resources> findResourcesListOne();

	List<ResourcesTree> getResourcesTree(Integer roleId);

	void deleteByRoleId(Integer roleId);

	int insertResourcesByRoleId(Map<String, Object> map);

	List<Resources> findResourcesListByManageId(Integer manageId);

	List<Resources> findResourcesListByPid(Map<String, Object> map);
	

}