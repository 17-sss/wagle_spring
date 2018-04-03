package wagle.members;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import mybatis.MybatisConnector;

public class MemberDBMybatis extends MybatisConnector{

	//mybatis namespace
		private final String namespace = "ldg.mybatis";	
		
		//Singleton : getInstance
			private static MemberDBMybatis instance = new MemberDBMybatis();
			public static MemberDBMybatis getInstance() {
				return instance;
			}
			private MemberDBMybatis() {	
			}
		//SqlSession	
			SqlSession sqlSession;
				
	    public int login(String email, String pwd) {
				      sqlSession = sqlSession();
				      Map<String,String> map = new HashMap<String,String>();
				      map.put("email", email);
				      map.put("pwd", pwd);
				      int chk=0;
				      
				      Map<String,String> map2=sqlSession.selectOne(namespace+".login", map);
				      
				      if (map2!=null && map2.containsValue(pwd)) {
				         chk=1;
				         sqlSession.close();
				         return chk;
				      }

				      if (map2!=null) {
				         chk=0;
				         sqlSession.close();
				         return chk;
				      }else {
				         chk=-1;
				         sqlSession.close();
				         return chk;
				      }
				   
				   }
		
	    //login�� name�޾ƿ��� �޼���
	    public MemberDataBean getUser2(String email, int chk) { 
			sqlSession= sqlSession();
			Map map = new HashMap();
			map.put("email", email);
			
			MemberDataBean user = sqlSession.selectOne(namespace+".getUser2", map);
			
			sqlSession.commit();
			sqlSession.close();
			
			return user;
		}
	    
	    
	    
	    	//insert
	    public void insertMember(MemberDataBean member) {
			sqlSession = sqlSession();
			int number = sqlSession.selectOne(namespace + ".getNextNum" ,member);
			member.setNum(number);
			
			sqlSession.insert(namespace+".insertMember", member);
			sqlSession.commit();
			sqlSession.close();
		}
	    
			//���̵�(�츮�� �̸���) �ߺ�üũ
			public boolean confirmId(String email) {
				sqlSession = sqlSession();
				boolean result = false;
				
				Map map = new HashMap();
				map.put("email", email);
				Map map2 = sqlSession.selectOne(namespace+".confirmId", map);
				
				if(map2!=null) {
					result=true;
				}
				sqlSession.close();
				return result;
			}
		    
			
			//update - getUser(chk "update")
			public MemberDataBean getUser(int num,String email, String chk) { 
				sqlSession= sqlSession();
				Map map = new HashMap();
				map.put("num", num);
				map.put("email", email);
				
				MemberDataBean user = sqlSession.selectOne(namespace+".getUser", map);
				
				sqlSession.commit();
				sqlSession.close();
				
				return user;
			}	
			
			
			//update method
			public int updateMember(MemberDataBean member) {
				
				sqlSession = sqlSession();
				int chk = sqlSession.update(namespace+".updateMember", member);
				sqlSession.commit(); 
				sqlSession.close();
				
				return chk;

			}
			
			//delete
			public int deleteMember(String email, String pwd, String admin)throws Exception{
				
				sqlSession = sqlSession();
				Map map = new HashMap();
				map.put("email", email);
				map.put("pwd", pwd);
				map.put("admin", admin);
			
				int x = -1;
				
				if(admin.equals("admin")) {
					x = sqlSession.delete(namespace+".deleteMember2", map);	
				
				}
				else {
					x = sqlSession.delete(namespace+".deleteMember", map);
				}
				sqlSession.commit(); 
				sqlSession.close();
				return x;
			}

	/**************************************************************************/		
			// ȸ�� �� �޼ҵ�
			public int getUserCount() {
				int x = 0;
				sqlSession=sqlSession();
				x = sqlSession.selectOne(namespace+".getUserCount");
				sqlSession.close();
				return x;
			}
			
			
			// ȸ������Ʈ ������ �޼ҵ�?
			public List getUsers(int startRow, int endRow) {
				sqlSession= sqlSession();
				Map map = new HashMap();
				map.put("startRow", startRow);
				map.put("endRow", endRow);
				List li = sqlSession.selectList(namespace + ".getUsers",map);
				sqlSession.close();
				return li;
			}

			
}
