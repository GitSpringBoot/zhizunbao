package www.zhizunbao.dto.insure;

import java.io.Serializable;

@SuppressWarnings("serial")
public class InsurePeople  implements Serializable{
    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column insure_people.people_id
     *
     * @mbggenerated Sun Apr 15 19:21:39 CST 2018
     */
    private Integer peopleId;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column insure_people.people
     *
     * @mbggenerated Sun Apr 15 19:21:39 CST 2018
     */
    private String people;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column insure_people.people_id
     *
     * @return the value of insure_people.people_id
     *
     * @mbggenerated Sun Apr 15 19:21:39 CST 2018
     */
    public Integer getPeopleId() {
        return peopleId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column insure_people.people_id
     *
     * @param peopleId the value for insure_people.people_id
     *
     * @mbggenerated Sun Apr 15 19:21:39 CST 2018
     */
    public void setPeopleId(Integer peopleId) {
        this.peopleId = peopleId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column insure_people.people
     *
     * @return the value of insure_people.people
     *
     * @mbggenerated Sun Apr 15 19:21:39 CST 2018
     */
    public String getPeople() {
        return people;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column insure_people.people
     *
     * @param people the value for insure_people.people
     *
     * @mbggenerated Sun Apr 15 19:21:39 CST 2018
     */
    public void setPeople(String people) {
        this.people = people;
    }
}