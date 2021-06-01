package com.microMart.util.shiro.realm;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;

import com.microMart.dao.MerchantMapper;
import com.microMart.entity.Merchant;
//import com.microMart.service.RoleService;

public class MyRealm extends AuthorizingRealm {
	@Autowired
	private MerchantMapper merchantMapper;
	//@Autowired
	//private RoleService roleService;

	/**
	 * 为账号进行授权并进行验证
	 * */
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection arg0) {
		// TODO Auto-generated method stub
		return null;
	}

	/**
	 * 对账号登录进行验证
	 * */
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authcToken) throws AuthenticationException {
		// TODO Auto-generated method stub
		UsernamePasswordToken token = (UsernamePasswordToken) authcToken;
		Merchant msg=new Merchant(token.getUsername(),String.valueOf(token.getPassword()));
		Merchant resultMsg=merchantMapper.getMerchant(msg);
		if(token.getUsername().equals(resultMsg.getUserName())
				&&
				String.valueOf(token.getPassword()).equals(resultMsg.getPassword())){
			return new SimpleAuthenticationInfo(resultMsg,resultMsg.getPassword(),resultMsg.getUserName());
		}else{
			throw new AuthenticationException();  
		}
	}

}
