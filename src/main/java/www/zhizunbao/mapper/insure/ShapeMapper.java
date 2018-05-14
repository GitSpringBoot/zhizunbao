package www.zhizunbao.mapper.insure;

import java.util.List;

import www.zhizunbao.dto.activity.UserRead;
import www.zhizunbao.dto.insure.Insure;
import www.zhizunbao.dto.insure.Shape;

public interface ShapeMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table shape
     *
     * @mbggenerated Sun Apr 15 19:18:38 CST 2018
     */
    int deleteByPrimaryKey(Integer shapeId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table shape
     *
     * @mbggenerated Sun Apr 15 19:18:38 CST 2018
     */
    int insert(Shape record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table shape
     *
     * @mbggenerated Sun Apr 15 19:18:38 CST 2018
     */
    int insertSelective(Shape record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table shape
     *
     * @mbggenerated Sun Apr 15 19:18:38 CST 2018
     */
    Shape selectByPrimaryKey(Integer shapeId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table shape
     *
     * @mbggenerated Sun Apr 15 19:18:38 CST 2018
     */
    int updateByPrimaryKeySelective(Shape record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table shape
     *
     * @mbggenerated Sun Apr 15 19:18:38 CST 2018
     */
    int updateByPrimaryKey(Shape record);

	List<Shape> findShapeListByInsureId(Insure insure2);

}