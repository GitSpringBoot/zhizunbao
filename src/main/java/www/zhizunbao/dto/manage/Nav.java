package www.zhizunbao.dto.manage;

import java.io.Serializable;

@SuppressWarnings("serial")
public class Nav implements Serializable{
    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column nav.nav_id
     *
     * @mbggenerated Sun Apr 15 19:04:46 CST 2018
     */
    private Integer navId;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column nav.nav_name
     *
     * @mbggenerated Sun Apr 15 19:04:46 CST 2018
     */
    private String navName;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column nav.nav_adress
     *
     * @mbggenerated Sun Apr 15 19:04:46 CST 2018
     */
    private String navAdress;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column nav.nav_id
     *
     * @return the value of nav.nav_id
     *
     * @mbggenerated Sun Apr 15 19:04:46 CST 2018
     */
    public Integer getNavId() {
        return navId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column nav.nav_id
     *
     * @param navId the value for nav.nav_id
     *
     * @mbggenerated Sun Apr 15 19:04:46 CST 2018
     */
    public void setNavId(Integer navId) {
        this.navId = navId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column nav.nav_name
     *
     * @return the value of nav.nav_name
     *
     * @mbggenerated Sun Apr 15 19:04:46 CST 2018
     */
    public String getNavName() {
        return navName;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column nav.nav_name
     *
     * @param navName the value for nav.nav_name
     *
     * @mbggenerated Sun Apr 15 19:04:46 CST 2018
     */
    public void setNavName(String navName) {
        this.navName = navName;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column nav.nav_adress
     *
     * @return the value of nav.nav_adress
     *
     * @mbggenerated Sun Apr 15 19:04:46 CST 2018
     */
    public String getNavAdress() {
        return navAdress;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column nav.nav_adress
     *
     * @param navAdress the value for nav.nav_adress
     *
     * @mbggenerated Sun Apr 15 19:04:46 CST 2018
     */
    public void setNavAdress(String navAdress) {
        this.navAdress = navAdress;
    }
}