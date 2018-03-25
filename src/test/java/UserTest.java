import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.shuren.pojo.User;
import com.shuren.service.UserService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"classpath:applicationContext.xml"})
public class UserTest {

	@Resource
	private UserService userService;
	
	@Test
	public void UserTest() {
		List<User> userList=userService.selectAllUser();
		for (User user : userList) {
			System.out.println(user.toString());
		}
		
	}
	
	@Test
	public void UserLikeTest() {
		String username="123";
		List<User> userList=userService.selectLikeUsername(username);
		for (User user : userList) {
			System.out.println(user.toString());
		}
		
	}
	@Test
	public void DeleteTest() {
		int id=11;
		userService.deleteUserById(id);
		List<User> userList=userService.selectAllUser();
		for (User user : userList) {
			System.out.println(user.toString());
		}
		
	}
	
	@Test
	public void UpdateTest() {
		User user=new User();
		user.setUserid(28);
		user.setPassword("123");
		user.setName("sdas");
		userService.updateUserById(user);
		
		
	}
	
}
