package www.zhizunbao.dto.insure;

import java.io.Serializable;

@SuppressWarnings("serial")
public class Shape  implements Serializable{
    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column shape.shape_id
     *
     * @mbggenerated Sun Apr 15 19:18:38 CST 2018
     */
    private Integer shapeId;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column shape.shape_name
     *
     * @mbggenerated Sun Apr 15 19:18:38 CST 2018
     */
    private String shapeName;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column shape.shape_id
     *
     * @return the value of shape.shape_id
     *
     * @mbggenerated Sun Apr 15 19:18:38 CST 2018
     */
    public Integer getShapeId() {
        return shapeId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column shape.shape_id
     *
     * @param shapeId the value for shape.shape_id
     *
     * @mbggenerated Sun Apr 15 19:18:38 CST 2018
     */
    public void setShapeId(Integer shapeId) {
        this.shapeId = shapeId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column shape.shape_name
     *
     * @return the value of shape.shape_name
     *
     * @mbggenerated Sun Apr 15 19:18:38 CST 2018
     */
    public String getShapeName() {
        return shapeName;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column shape.shape_name
     *
     * @param shapeName the value for shape.shape_name
     *
     * @mbggenerated Sun Apr 15 19:18:38 CST 2018
     */
    public void setShapeName(String shapeName) {
        this.shapeName = shapeName;
    }
}