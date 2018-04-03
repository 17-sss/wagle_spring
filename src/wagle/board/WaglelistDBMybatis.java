package wagle.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;

import mybatis.MybatisConnector;




public class WaglelistDBMybatis extends MybatisConnector{
	private final String namespace = "ldg.mybatis";
	private static WaglelistDBMybatis instance = new WaglelistDBMybatis();
	
	private WaglelistDBMybatis() {

	}

	public static WaglelistDBMybatis getInstance() {
		return instance;
	}

	
	SqlSession sqlSession;
	
	//�ͱ��� �����Ѵ�.
	public void wagleOpen(WagleDataBean wagle) {
		sqlSession = sqlSession();

		int number=sqlSession.selectOne(namespace+".getNextNumber",wagle);
		
		wagle.setWboardid(number);
					
		sqlSession.insert(namespace+".wagleOpen",wagle);
		sqlSession.commit(); 
		sqlSession.close();
		
	}
	
	//���� ������ �ͱ� ����
	public int getWagleCount1(String name) {
		sqlSession = sqlSession();
		Map map = new HashMap();
		map.put("name", name);
		
		int number=sqlSession.selectOne(namespace+".getWagleCount1",map);
		
		sqlSession.close();
		
		return number;
	}
	
	//���� ������ �ͱ� ���� 
	public int getWagleCount2(String name) {
		sqlSession = sqlSession();
		Map map = new HashMap();
		map.put("name", name);
		
		int number=sqlSession.selectOne(namespace+".getWagleCount2",map);
		
		sqlSession.close();
		
		return number;
	}
	
	//�ͱ��� ȸ�� ��
	public int getWagleCount3(int wboardid) {
		sqlSession = sqlSession();
		Map map = new HashMap();
		map.put("wboardid", wboardid);
		
		int number=sqlSession.selectOne(namespace+".getWagleCount3",map);
		
		sqlSession.close();
		
		return number;
	}
	
	//���� ������ �ͱ��� ����Ʈ
	public List getWagles1(String name) {
		sqlSession = sqlSession();
		Map map = new HashMap();
		map.put("name", name);

		List li = sqlSession.selectList(namespace+".getWagles1",map);
		
		sqlSession.close();
		return li;
	}
	
	//���� ������ �ͱ��� ����Ʈ 
	public List getWagles2(String name) {
		sqlSession = sqlSession();
		Map map = new HashMap();
		map.put("name", name);

		
		List li = sqlSession.selectList(namespace+".getWagles2",map);
		sqlSession.close();
		return li;
	}
	

	
	
	//���� ������ �ͱ��� ���� ����
	public WagleDataBean getWagle(int wboardid) {
		sqlSession = sqlSession();
		Map map = new HashMap();
		map.put("wboardid", wboardid);
		
		
		WagleDataBean wagle = sqlSession.selectOne(namespace+".getWagle",map);
		sqlSession.close();
		
		return wagle;
	}
	
	public int updateWagle(WagleDataBean wagle) {
		
		sqlSession = sqlSession();
		
		//�ͱ����� �ͱ��� �����Ѵ�.
		int chk = sqlSession.update(namespace+".updateWagle",wagle);
		
		//�ͱ����� �ͱ۸��� �ٲٸ� �ͱ۷����׵� �ͱ۸��� �ٲ��.
		int chk2 = sqlSession.update(namespace+".updateWagle2",wagle);
		sqlSession.commit(); 
		sqlSession.close();
		
		System.out.println(chk);
		
		return chk;
	}
	
	//�ͱ����� �ͱ��� �����Ѵ�.
	 public int deleteWagle(int wboardid) throws Exception {
		sqlSession = sqlSession();
		Map map = new HashMap();
		map.put("wboardid", wboardid);
		
		int chk=sqlSession.delete(namespace+".deleteWagle",map);
		
		sqlSession.commit();
		sqlSession.close();
		
		return chk;
	}
	 
	 //��ܹ��� �ͱۿͱۿ��� ��� �ͱ۸���Ʈ Ȯ�� ���� 
	 public List getWaglelist() {
			sqlSession = sqlSession();
			List li = sqlSession.selectList(namespace+".getWaglelist");
			sqlSession.close();
			return li;
	}
	 
	 //���ϴ� �ͱۿ� �����Ѵ�. 
	 public void wagleJoin(int wboardid,String wagler,String wname) {
			sqlSession = sqlSession();
			Map map = new HashMap();
			map.put("wboardid", wboardid);
			map.put("wagler", wagler);
			map.put("wname", wname);


			sqlSession.insert(namespace+".wagleJoin",map);
			
			sqlSession.commit(); 
			sqlSession.close();
	}
	 
	 //��ġ �ʴ� �ͱۿ��� Ż���Ѵ�.
	 public int wagleOut(int wboardid,String wagler) throws Exception {
			sqlSession = sqlSession();
			Map map = new HashMap();
			map.put("wboardid", wboardid);
			map.put("wagler", wagler);
			
			int chk=sqlSession.delete(namespace+".wagleOut",map);
			
			sqlSession.commit();
			sqlSession.close();
			
			return chk;
	}
	 
	 public List imgslide() {
			sqlSession = sqlSession();
			List li = sqlSession.selectList(namespace+".imgslide");
			sqlSession.close();
			return li;
	}
	 
	//�ͱۿͱ� ����Ʈ���� ���� ������ �ͱ����� �ƴ��� üũ�Ͽ� ��ư�� Ȱ��ȭ ���θ� �����Ѵ�
	public boolean waglechk(int wboardid, String wagler) {
		sqlSession = sqlSession();
		Map map = new HashMap();
		map.put("wboardid", wboardid);
		map.put("wagler", wagler);
		boolean li=true;
		Map<String,String> map2=sqlSession.selectOne(namespace+".waglechk",map);
		
		if (map2!=null) {
			//���Ե� ����
			li=true;
		}else {
			//���Ծȵ� ����
			li=false;
		}
		return li;
	}
	
	
	
	
}
