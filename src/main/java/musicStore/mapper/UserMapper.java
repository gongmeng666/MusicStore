package musicStore.mapper;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import musicStore.entity.User;

public interface UserMapper {
	User checkLogin(@Param("username")String username,@Param("password")String password);
	void add(User user);
	@Select("select * from User where Username=#{username}")
	User fetchByUsername(String username);
}
