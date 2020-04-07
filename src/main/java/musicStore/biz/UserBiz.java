package musicStore.biz;

import org.apache.ibatis.annotations.Param;

import musicStore.entity.User;

public interface UserBiz {
	User checkLogin(@Param("username")String username,@Param("password")String password);
	void add(User user);
	User fetchByUsername(String username);
}
