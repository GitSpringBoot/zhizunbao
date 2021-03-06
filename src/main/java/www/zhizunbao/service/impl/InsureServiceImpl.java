package www.zhizunbao.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import www.zhizunbao.dto.activity.UserDiscounts;
import www.zhizunbao.dto.insure.Feature;
import www.zhizunbao.dto.insure.Img;
import www.zhizunbao.dto.insure.Insure;
import www.zhizunbao.dto.insure.InsureFeature;
import www.zhizunbao.dto.insure.InsurePeople;
import www.zhizunbao.dto.insure.InsureSafeGuard;
import www.zhizunbao.dto.insure.InsureType;
import www.zhizunbao.dto.insure.SafeGuard;
import www.zhizunbao.dto.insure.Shape;
import www.zhizunbao.dto.insure.Type;
import www.zhizunbao.dto.manage.Manage;
import www.zhizunbao.dto.manage.UserInfo;
import www.zhizunbao.mapper.activity.UserDiscountsMapper;
import www.zhizunbao.mapper.insure.FeatureMapper;
import www.zhizunbao.mapper.insure.ImgMapper;
import www.zhizunbao.mapper.insure.InsureFeatureMapper;
import www.zhizunbao.mapper.insure.InsureMapper;
import www.zhizunbao.mapper.insure.InsurePeopleMapper;
import www.zhizunbao.mapper.insure.InsureSafeGuardMapper;
import www.zhizunbao.mapper.insure.InsureTypeMapper;
import www.zhizunbao.mapper.insure.SafeGuardMapper;
import www.zhizunbao.mapper.insure.ShapeMapper;
import www.zhizunbao.mapper.insure.TypeMapper;
import www.zhizunbao.service.InsureService;
import www.zhizunbao.utils.LogUtil;
@Service
public class InsureServiceImpl implements InsureService {
	
	@Autowired
	private InsureMapper insureMapper;
	@Autowired
	private InsurePeopleMapper insurePeopleMapper;
	@Autowired
	private TypeMapper typeMapper;
	@Autowired
	private FeatureMapper featureMapper;
	@Autowired
	private SafeGuardMapper safeGuardMapper;
	@Autowired
	private ImgMapper imgMapper;
	@Autowired
	private ShapeMapper shapeMapper;
	@Autowired
	private InsureSafeGuardMapper insureSafeGuardMapper;
	@Autowired
	private InsureTypeMapper insureTypeMapper;
	@Autowired
	private InsureFeatureMapper insureFeatureMapper;
	
	@Autowired
	private UserDiscountsMapper userDiscountsMapper;
	
	/**
	 * 
	 * Mr吴  2018年4月16日 上午11:18:03
	 * 功能 ：查询保险
	 * @param insure
	 * @return
	 */
	@Override
	public List<Insure> findInsureList(Insure insure, HttpServletRequest request) {
		
		Manage man = (Manage) request.getSession().getAttribute("man");
		LogUtil.mdc(man.getRealName()); 
		Logger logger = LogUtil.getLogger(InsureServiceImpl.class);
		
		try {
			 List<Insure> insureList = insureMapper.findInsureList(insure);
			 logger.info("查询保险成功");
			 return insureList;
		 } catch (Exception e) {
			e.printStackTrace();
			logger.error("查询保险失败");
			return null;
		}
	}
	
	/**
	 * 
	 * Mr吴  2018年4月16日 下午1:46:22
	 * 功能 ：查询总条数
	 * @return
	 */
	@Override
	public int findInsureCount() {
		// TODO Auto-generated method stub
		return insureMapper.findInsureCount();
	}
	
	/**
	 * 
	 * Mr吴  2018年4月16日 下午5:59:44
	 * 功能 ：查询所有适用人群
	 * @param people
	 * @return
	 */
	@Override
	public List<InsurePeople> findPeoplelist() {
		// TODO Auto-generated method stub
		return insurePeopleMapper.findPeoplelist();
	}
	
	/**
	 * 
	 * Mr吴  2018年4月16日 下午7:04:54
	 * 功能 ： 添加保险
	 * @return
	 */
	@Override
	public int addInsure(Insure insure,HttpServletRequest request) {
		
		Manage man = (Manage) request.getSession().getAttribute("man");
		LogUtil.mdc(man.getRealName()); 
		Logger logger = LogUtil.getLogger(InsureServiceImpl.class);
		try {
			logger.info("添加保险成功");
			return insureMapper.insertSelective(insure);
		} catch (Exception e) {
			logger.error("添加保险失败");
			return 0;
		}
		
	}
	
	/**
	 * 
	 * Mr吴  2018年4月16日 下午7:48:06
	 * 功能 ：根据id查询保险
	 * @param insureId
	 * @return
	 */
	@Override
	public Insure findInsureByInsureId(Integer insureId) {
		// TODO Auto-generated method stub
		return insureMapper.selectByPrimaryKey(insureId);
	}
	
	/**
	 * 
	 * Mr吴  2018年4月18日 下午8:52:39
	 * 功能 ：删除保险
	 * @param insureId
	 * @return
	 */
	@Override
	public int deleteInsure(Integer insureId,HttpServletRequest request) {
		
		Manage man = (Manage) request.getSession().getAttribute("man");
		LogUtil.mdc(man.getRealName()); 
		Logger logger = LogUtil.getLogger(InsureServiceImpl.class);
		
		try {
			insureFeatureMapper.deleteByInsureId(insureId);
			insureSafeGuardMapper.deleteByInsureId(insureId);
			insureTypeMapper.deleteByInsureId(insureId);
			Insure insure = insureMapper.selectByPrimaryKey(insureId);
			imgMapper.deleteByPrimaryKey(insure.getImgId());
			logger.info("删除保险成功");
			return insureMapper.deleteByPrimaryKey(insureId);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			logger.error("删除保险失败");
			return 0;
		}
		
	}
	
	/**
	 * 
	 * Mr吴  2018年4月16日 下午8:15:39
	 * 功能 ： 修改保险
	 * @param insure
	 * @return
	 */
	@Override
	public int updateInsure(Insure insure,HttpServletRequest request) {
		// TODO Auto-generated method stub
		
		Manage man = (Manage) request.getSession().getAttribute("man");
		LogUtil.mdc(man.getRealName()); 
		Logger logger = LogUtil.getLogger(InsureServiceImpl.class);
		
		try {
			logger.info("修改保险成功");
			return insureMapper.updateByPrimaryKeySelective(insure);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			logger.error("修改保险失败");
			return 0;
		}
	}
	
	/**
	 * 
	 * Mr吴  2018年4月17日 上午8:53:09
	 * 功能 ： 查询保险分类
	 * @return
	 */
	@Override
	public List<Type> findTypeList() {
		// TODO Auto-generated method stub
		return typeMapper.findTypeList();
	}
	
	/**
	 * 
	 * Mr吴  2018年4月17日 上午10:30:18
	 * 功能 ：查询最高级的类别
	 * @return
	 */
	@Override
	public List<Type> findTopTypeList() {
		// TODO Auto-generated method stub
		return typeMapper.findTopTypeList();
	}
	
	/**
	 * 
	 * Mr吴  2018年4月17日 上午11:20:55
	 * 功能 ：新增类别
	 * @param type
	 * @return
	 */
	@Override
	public int addType(HttpServletRequest request,Type type) {
		// TODO Auto-generated method stub
		Manage man = (Manage) request.getSession().getAttribute("man");
		LogUtil.mdc(man.getRealName()); 
		Logger logger = LogUtil.getLogger(InsureServiceImpl.class);
		try {
			logger.info("添加保险类型成功");
			return typeMapper.insert(type);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			logger.error("添加保险类型失败");
			return 0;
		}
		
	}
	
	/**
	 * 
	 * Mr吴  2018年4月17日 上午11:40:40
	 * 功能 ：根据id查询类型
	 * @param typeId
	 * @return
	 */
	@Override
	public Type findTypeBytypeId(Integer typeId) {
		// TODO Auto-generated method stub
		return typeMapper.selectByPrimaryKey(typeId);
	}

	/**
	 * 
	 * Mr吴  2018年4月17日 上午11:43:32
	 * 功能 ：修改类型
	 * @param type
	 * @return
	 */
	@Override
	public int updateType(HttpServletRequest request,Type type) {
		// TODO Auto-generated method stub
		Manage man = (Manage) request.getSession().getAttribute("man");
		LogUtil.mdc(man.getRealName()); 
		Logger logger = LogUtil.getLogger(InsureServiceImpl.class);
		try {
			logger.info("修改类型成功");
			return typeMapper.updateByPrimaryKey(type);
		} catch (Exception e) {
			// TODO: handle exception
			logger.error("修改类型失败");
			e.printStackTrace();
			return 0;
		}
	}

	/**
	 * 
	 * Mr吴  2018年4月17日 上午11:46:05
	 * 功能 ：删除类型
	 * @param typeId
	 * @return
	 */
	@Override
	public int deleteType(HttpServletRequest request,Integer typeId) {
		// TODO Auto-generated method stub
		Manage man = (Manage) request.getSession().getAttribute("man");
		LogUtil.mdc(man.getRealName()); 
		Logger logger = LogUtil.getLogger(InsureServiceImpl.class);
		try {
			logger.info("删除类型成功");
			return typeMapper.deleteByPrimaryKey(typeId);
		} catch (Exception e) {
			// TODO: handle exception
			logger.error("删除类型失败");
			e.printStackTrace();
			return 0;
		}
		
	}
	
	/**
	 * 
	 * Mr吴  2018年4月17日 下午2:16:29
	 * 功能 ：查询特色
	 * @return
	 */
	@Override
	public List<Feature> findFeatureList() {
		// TODO Auto-generated method stub
		return featureMapper.findFeatureList();
	}
	
	/**
	 * 
	 * Mr吴  2018年4月17日 下午2:42:01
	 * 功能 ：新增特色
	 * 	 * @param feature
	 * @return
	 */
	@Override
	public int addFeature(HttpServletRequest request, Feature feature) {
		// TODO Auto-generated method stub
		Manage man = (Manage) request.getSession().getAttribute("man");
		LogUtil.mdc(man.getRealName()); 
		Logger logger = LogUtil.getLogger(InsureServiceImpl.class);
		try {
			logger.info("新增特色成功");
			return featureMapper.insert(feature);
		} catch (Exception e) {
			// TODO: handle exception
			logger.error("新增特色失败");
			e.printStackTrace();
			return 0;
		}
		
	}
	
	/**
	 * 
	 * Mr吴  2018年4月17日 下午4:23:57
	 * 功能 ：查询所有保障范围
	 * 	 * @return
	 */
	@Override
	public List<SafeGuard> findSafeGuardList() {
		// TODO Auto-generated method stub
		return safeGuardMapper.findSafeGuardList();
	}
	
	/**
	 * 
	 * Mr吴  2018年4月17日 下午4:24:39
	 * 功能 ：新增保障范围
	 * @param safeGuard
	 * @return
	 */
	@Override
	public int addSafeGuard(HttpServletRequest request, SafeGuard safeGuard) {
		// TODO Auto-generated method stub
		Manage man = (Manage) request.getSession().getAttribute("man");
		LogUtil.mdc(man.getRealName()); 
		Logger logger = LogUtil.getLogger(InsureServiceImpl.class);
		try {
			logger.info("保障范围新增成功");
			return safeGuardMapper.insert(safeGuard);
		} catch (Exception e) {
			// TODO: handle exception
			logger.error("保障范围新增失败");
			e.printStackTrace();
			return 0;
		}
	}
	
	/**
	 * 
	 * Mr吴  2018年4月17日 下午4:29:41
	 * 功能 ：根据id 查询保障范围
	 * @param safeguardId
	 * @return
	 */
	@Override
	public SafeGuard findSafeGuardBySafeGuardId(Integer safeguardId) {
		// TODO Auto-generated method stub
		return safeGuardMapper.selectByPrimaryKey(safeguardId);
	}
	
	/**
	 * 
	 * Mr吴  2018年4月17日 下午4:34:29
	 * 功能 ：修改保障范围
	 * @param safeGuard
	 * @return
	 */
	@Override
	public int updateSafeGuard(HttpServletRequest request, SafeGuard safeGuard) {
		// TODO Auto-generated method stub
		Manage man = (Manage) request.getSession().getAttribute("man");
		LogUtil.mdc(man.getRealName()); 
		Logger logger = LogUtil.getLogger(InsureServiceImpl.class);
		try {
			logger.info("保障范围修改成功");
			return safeGuardMapper.updateByPrimaryKey(safeGuard);
		} catch (Exception e) {
			// TODO: handle exception
			logger.error("保障范围修改失败");
			e.printStackTrace();
			return 0;
		}
	}
	
	/**
	 * 
	 * Mr吴  2018年4月17日 下午4:40:36
	 * 功能 ：删除保障范围
	 * @param safeguardId
	 * @return
	 */
	@Override
	public int deleteSafeGuard(HttpServletRequest request,Integer safeguardId) {
		// TODO Auto-generated method stub
		Manage man = (Manage) request.getSession().getAttribute("man");
		LogUtil.mdc(man.getRealName()); 
		Logger logger = LogUtil.getLogger(InsureServiceImpl.class);
		try {
			logger.info("删除成功");
			return safeGuardMapper.deleteByPrimaryKey(safeguardId);
		} catch (Exception e) {
			// TODO: handle exception
			logger.error("删除失败");
			e.printStackTrace();
			return 0;
		}
		
	}
	/**
	 * 
	 * Mr吴  2018年4月17日 下午8:50:24
	 * 功能 ：上传图片
	 * @param imgUrl
	 * @param insure
	 * @return
	 */
	@Override
	public int uploadImg(HttpServletRequest request,String imgUrl, Insure insure) {
		
		Manage man = (Manage) request.getSession().getAttribute("man");
		LogUtil.mdc(man.getRealName()); 
		Logger logger = LogUtil.getLogger(InsureServiceImpl.class);
		
		try {
			Img img = new Img();
			img.setImgAlt("无法显示图片");
			img.setImgSrc(imgUrl);
			imgMapper.insert(img);
			insure.setImgId(img.getImgId());
			logger.info("上传图片成功");
			return insureMapper.updateByPrimaryKeySelective(insure);
		} catch (Exception e) {
			// TODO: handle exception
			logger.error("图片上传失败");
			e.printStackTrace();
			return 0;
		}
	}
	
	/**
	 * 
	 * Mr吴  2018年4月18日 上午11:27:08
	 * 功能 ：根据insureId 查询相应的保单形式
	 * @param insure2
	 * @return
	 */
	@Override
	public List<Shape> findShapeListByInsureId(Insure insure2) {
		// TODO Auto-generated method stub
		return shapeMapper.findShapeListByInsureId(insure2);
	}
	
	/**
	 * 
	 * Mr吴  2018年4月18日 下午5:03:48
	 * 功能 ：保险复杂新增
	 * @param insure
	 * @param peopleId
	 * @param feature
	 * @param safeguard
	 * @param typeId
	 * @return
	 */
	@Override
	public int addInsure(Insure insure, Integer[] feature, Integer[] safeguard, Integer typeId,HttpServletRequest request) {
		int i=0;
		Manage man = (Manage) request.getSession().getAttribute("man");
		LogUtil.mdc(man.getRealName()); 
		Logger logger = LogUtil.getLogger(InsureServiceImpl.class);
		try {
			insureMapper.insert(insure);
			if (null!=feature) {
				Map<String,Object> map = new HashMap<String, Object>();
				map.put("insureId", insure.getInsureId());
				map.put("features",feature);
				insureFeatureMapper.insertAll(map);
			}
			if (null!=safeguard) {
				Map<String,Object> map = new HashMap<String, Object>();
				map.put("insureId", insure.getInsureId());
				map.put("safeguards",safeguard);
				insureSafeGuardMapper.insertAll(map);
			}
			InsureType insureType = new InsureType();
			insureType.setTypeId(typeId);
			insureType.setInsureId(insure.getInsureId());
			i= insureTypeMapper.insert(insureType);
			logger.info("保险新增成功");
			return i;
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("保险新增失败");
			return i;
		}
		
	}
	
	/**
	 * 
	 * Mr吴  2018年4月18日 下午7:12:53
	 * 功能 ：回显保险特色，保障范围和保障范围
	 * @param insureId
	 * @return
	 */
	@Override
	public Map<String, Object> findOtherByInsureId(Integer insureId) {
		Insure insure = insureMapper.selectByPrimaryKey(insureId);
		List<InsureFeature> insureFeatures = insureFeatureMapper.findInsureFeatureByInsureId(insureId);
		List<InsureSafeGuard> insureSafeGuards = insureSafeGuardMapper.findInsureSafeGuardByInsureId(insureId);
		InsureType insureType = insureTypeMapper.findInsureTypeByInsureId(insureId);
		Map<String,Object> map = new HashMap<String , Object>();
		map.put("insure", insure);
		map.put("insureFeatures", insureFeatures);
		map.put("insureSafeGuards", insureSafeGuards);
		map.put("insureType", insureType);
		return map;
	}
	
	/**
	 * 
	 * Mr吴  2018年4月18日 下午8:35:02
	 * 功能 ：保险复杂修改
	 * @param insure
	 * @param feature
	 * @param safeguard
	 * @param typeId
	 * @return
	 */
	@Override
	public int updateInsure(HttpServletRequest request, Insure insure, Integer[] feature, Integer[] safeguard, Integer typeId) {
		
		Manage man = (Manage) request.getSession().getAttribute("man");
		LogUtil.mdc(man.getRealName()); 
		Logger logger = LogUtil.getLogger(InsureServiceImpl.class);
		
		try {
			insureMapper.updateByPrimaryKeySelective(insure);
			insureFeatureMapper.deleteByInsureId(insure.getInsureId());
			if (null!=feature) {
				Map<String,Object> map = new HashMap<String, Object>();
				map.put("insureId", insure.getInsureId());
				map.put("features",feature);
				insureFeatureMapper.insertAll(map);
			}
			insureSafeGuardMapper.deleteByInsureId(insure.getInsureId());
			if (null!=safeguard) {
				Map<String,Object> map = new HashMap<String, Object>();
				map.put("insureId", insure.getInsureId());
				map.put("safeguards",safeguard);
				insureSafeGuardMapper.insertAll(map);
			}
			InsureType insureType = new InsureType();
			insureType.setTypeId(typeId);
			insureType.setInsureId(insure.getInsureId());
			insureTypeMapper.deleteByInsureId(insure.getInsureId());
			logger.info("保险复杂修改成功");
			return insureTypeMapper.insert(insureType);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			logger.error("保险复杂修改失败");
			return 0;
		}
		
	}
	
	/**
	 * 
	 * Mr吴  2018年4月20日 上午11:50:16
	 * 功能 ：根据pid查询类型
	 * @return
	 */
	@Override
	public List<Type> findtypeListByPid(Integer pid) {
		// TODO Auto-generated method stub
		return typeMapper.findTypeListByPid(pid);
	}
	
	/**
	 * 
	 * Mr吴  2018年4月20日 下午2:50:01
	 * 功能 ：根据pid查询所有的保险
	 * @param pid
	 * @return
	 */
	@Override
	public List<Insure> findInsureListByPid(Integer pid) {
		// TODO Auto-generated method stub
		return insureMapper.findInsureListByPid(pid);
	}
	
	/**
	 * 
	 * Mr吴  2018年4月20日 下午2:50:25
	 * 功能 ：根据typeId查询所有子类型
	 * @param typeId
	 * @return
	 */
	@Override
	public List<Type> findTypeListByTypeId(Integer typeId) {
		// TODO Auto-generated method stub
		return typeMapper.findTypeListByPid(typeId);
	}
	
	/**
	 * 
	 * Mr吴  2018年4月20日 下午3:13:05
	 * 功能 ：根据TypeId查询所有的保险
	 * @param typeId
	 * @return
	 */
	@Override
	public List<Insure> findInsureListByTypeId(Integer typeId) {
		// TODO Auto-generated method stub
		return insureMapper.findInsureListByTypeId(typeId);
	}
	
	/**
	 * 
	 * Mr吴  2018年4月22日 下午2:23:25
	 * 功能 ：查询单个保险所有相关信息
	 * @param insureId
	 * @return
	 */
	@Override
	public Insure findInsureInformationByInsureId(Integer insureId) {
		Insure insure = insureMapper.findInsureByInsureId(insureId);
		List<Feature> features = featureMapper.findFeatureListByInsureId(insureId);
		List<SafeGuard> safeGuards = safeGuardMapper.findSafeGuardListByInsureId(insureId);
		insure.setFeatures(features);
		insure.setSafeGuards(safeGuards);
		return insure;
	}
	
	/**
	 * 
	 * Mr吴  2018年4月22日 下午6:28:14
	 * 功能 ：根据id查询保险及其相应的图片
	 * @param insureId
	 * @return
	 */
	@Override
	public Insure findInsureNameAndImgSrcById(Integer insureId) {
		
		return insureMapper.findInsureNameAndImgSrcById(insureId);
	}
	
	/**
	 * 
	 * Mr吴  2018年4月22日 下午6:43:50
	 * 功能 ：根据id查询img
	 * @param imgId
	 * @return
	 */
	@Override
	public int deleteImgByImgId(Integer imgId,HttpServletRequest request) {
		// TODO Auto-generated method stub
		Manage man = (Manage) request.getSession().getAttribute("man");
		LogUtil.mdc(man.getRealName()); 
		Logger logger = LogUtil.getLogger(InsureServiceImpl.class);
		try {
			logger.info("删除图片成功");
			return imgMapper.deleteByPrimaryKey(imgId);
		} catch (Exception e) {
			// TODO: handle exception
			logger.error("删除图片失败");
			return 0;
		}
		
	}
	
	/**
	 * 
	 * Mr吴  2018年4月24日 下午4:14:45
	 * 功能 ：给保险添加一人
	 * @param insure
	 * @return
	 */
	@Override
	public int updateInsureUp(Integer insureId,HttpServletRequest request) {
		// TODO Auto-generated method stub
		UserInfo man = (UserInfo) request.getSession().getAttribute("userInfo1");
		LogUtil.mdc(man.getUserName()); 
		Logger logger = LogUtil.getLogger(InsureServiceImpl.class);
		try {
			logger.info("保险购买成功");
			return insureMapper.updateInsureUp(insureId);
		} catch (Exception e) {
			// TODO: handle exception
			logger.error("保险购买失败");
			return 0;
		}
		
	}
	
	/**
	 * 
	 * Mr吴  2018年4月26日 上午11:42:03
	 * 功能 ：根据查询条件查询总条数
	 * @param chaxun
	 * @return
	 */
	@Override
	public int findInsureCountByName(Insure insure) {
		// TODO Auto-generated method stub
		return insureMapper.findInsureCountByName(insure);
	}
	
	/**
	 * 
	 * Mr吴  2018年4月26日 上午11:51:45
	 * 功能 ：根据条件模糊查询保险集合
	 * @param map
	 * @return
	 */
	@Override
	public List<Insure> findInsureListLimit(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return insureMapper.findInsureListLimit(map);
	}
	
	/**
	 * 
	 * Mr吴  2018年4月28日 下午8:14:40
	 * 功能 ：批量插入保障范围
	 * @param list
	 */
	@Override
	public void addSafeGuardList(List<SafeGuard> list) {
		// TODO Auto-generated method stub
		safeGuardMapper.addSafeGuardList(list);
	}
	
	/**
	 * 
	 * Mr吴  2018年4月29日 下午4:46:52
	 * 功能 ：查询人员参与活动的金钱
	 * @param userId
	 * @return
	 */
	@Override
	public List<UserDiscounts> findUserDiscountsListByUserId(Integer userId) {
		// TODO Auto-generated method stub
		return userDiscountsMapper.findUserDiscountsListByUserId(userId);
	}
	
	
}
