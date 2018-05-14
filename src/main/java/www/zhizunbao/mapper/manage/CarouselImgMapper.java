package www.zhizunbao.mapper.manage;

import java.util.List;

import www.zhizunbao.dto.manage.CarouselImg;

public interface CarouselImgMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table carousel_img
     *
     * @mbggenerated Sun Apr 15 19:05:34 CST 2018
     */
    int deleteByPrimaryKey(Integer carouselId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table carousel_img
     *
     * @mbggenerated Sun Apr 15 19:05:34 CST 2018
     */
    int insert(CarouselImg record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table carousel_img
     *
     * @mbggenerated Sun Apr 15 19:05:34 CST 2018
     */
    int insertSelective(CarouselImg record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table carousel_img
     *
     * @mbggenerated Sun Apr 15 19:05:34 CST 2018
     */
    CarouselImg selectByPrimaryKey(Integer carouselId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table carousel_img
     *
     * @mbggenerated Sun Apr 15 19:05:34 CST 2018
     */
    int updateByPrimaryKeySelective(CarouselImg record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table carousel_img
     *
     * @mbggenerated Sun Apr 15 19:05:34 CST 2018
     */
    int updateByPrimaryKey(CarouselImg record);

	List<CarouselImg> findCarouseImgList();

	void setImgTocarouselImg(Integer img_id);

}