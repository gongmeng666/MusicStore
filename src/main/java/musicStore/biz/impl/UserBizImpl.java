package musicStore.biz.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import musicStore.biz.UserBiz;
import musicStore.entity.User;
import musicStore.mapper.UserMapper;

@Service
public class UserBizImpl implements UserBiz{
	@Autowired
	private UserMapper userdb;
	
	

	@Override
	public User checkLogin(String username, String password) {
	return userdb.checkLogin(username, password);
	}

	@Override
	public void add(User user) {
		userdb.add(user);
	}

	@Override
	public User fetchByUsername(String username) {
		return userdb.fetchByUsername(username);
	}

}
