package www.zhizunbao.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import www.zhizunbao.dto.activity.UserDiscounts;
import www.zhizunbao.dto.insure.Feature;
import www.zhizunbao.dto.insure.Insure;
import www.zhizunbao.dto.insure.InsurePeople;
import www.zhizunbao.dto.insure.SafeGuard;
import www.zhizunbao.dto.insure.Shape;
import www.zhizunbao.dto.insure.Type;

public interface InsureService {

	List<Insure> findInsureList(Insure insure, HttpServletRequest request);

	int findInsureCount();

	List<InsurePeople> findPeoplelist();

	int addInsure(Insure insure,HttpServletRequest request);

	Insure findInsureByInsureId(Integer insureId);

	int deleteInsure(Integer insureId,HttpServletRequest request);

	int updateInsure(Insure insure,HttpServletRequest request);

	List<Type> findTypeList();

	List<Type> findTopTypeList();

	int addType(HttpServletRequest request,Type type);

	Type findTypeBytypeId(Integer typeId);

	int updateType(HttpServletRequest request,Type type);

	int deleteType(HttpServletRequest request,Integer typeId);

	List<Feature> findFeatureList();

	int addFeature(HttpServletRequest request,Feature feature);

	List<SafeGuard> findSafeGuardList();

	int addSafeGuard(HttpServletRequest request,SafeGuard safeGuard);

	SafeGuard findSafeGuardBySafeGuardId(Integer safeguardId);

	int updateSafeGuard(HttpServletRequest request,SafeGuard safeGuard);

	int deleteSafeGuard(HttpServletRequest request,Integer safeguardId);

	int uploadImg(HttpServletRequest request,String imgUrl, Insure insure);

	List<Shape> findShapeListByInsureId(Insure insure2);

	int addInsure(Insure insure, Integer[] feature, Integer[] safeguard, Integer typeId,HttpServletRequest request);

	Map<String, Object> findOtherByInsureId(Integer insureId);

	int updateInsure(HttpServletRequest request,Insure insure, Integer[] feature, Integer[] safeguard, Integer typeId);

	List<Type> findtypeListByPid(Integer pid);

	List<Insure> findInsureListByPid(Integer pid);

	List<Type> findTypeListByTypeId(Integer typeId);

	List<Insure> findInsureListByTypeId(Integer typeId);

	Insure findInsureInformationByInsureId(Integer insureId);

	Insure findInsureNameAndImgSrcById(Integer insureId);

	int deleteImgByImgId(Integer imgId,HttpServletRequest request);

	int updateInsureUp(Integer insureId,HttpServletRequest request);

	int findInsureCountByName(Insure insure);

	List<Insure> findInsureListLimit(Map<String, Object> map);

	void addSafeGuardList(List<SafeGuard> list);

	List<UserDiscounts> findUserDiscountsListByUserId(Integer userId);

}
