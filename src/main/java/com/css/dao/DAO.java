package com.css.dao;

import java.util.List;

public interface DAO {
	
	/**
	 * 保存对象
	 * @param str
	 * @param obj
	 * @return
	 * @throws Exception
	 */
	public Object save(String str, Object obj) throws Exception;

	/**
	 * 批量保存
	 * @param str
	 * @param objs
	 * @return
	 * @throws Exception
	 */
	public Object batchSave(String str,List objs) throws Exception;

	/**
	 * 修改对象
	 * @param str
	 * @param obj
	 * @return
	 * @throws Exception
	 */
	public Object update(String str, Object obj) throws Exception;
	
	/**
	 * 删除对象 
	 * @param str
	 * @param obj
	 * @return
	 * @throws Exception
	 */
	public Object delete(String str, Object obj) throws Exception;

	/**
	 * 批量删除
	 * @param str
	 * @param objs
	 * @return
	 * @throws Exception
	 */
	public Object batchDelete(String str,List objs) throws Exception;

	/**
	 * 查找对象
	 * @param str
	 * @param obj
	 * @return
	 * @throws Exception
	 */
	public Object findForObject(String str, Object obj) throws Exception;

	/**
     * @return
	 * @throws Exception
	 */
	public Object findForList(String statement, Object parameter) throws Exception;

	/**
	 * 查找对象
	 * @param statement
	 * @param string
	 * @param parameter
	 * @return
	 * @throws Exception
	 */
	public Object findForList(String statement, String string,Object parameter);
	/**
	 * 查找对象封装成Map
	 * @param sql
	 * @param obj
	 * @param key
	 * @param value
	 * @return
	 * @throws Exception
	 */
	public Object findForMap(String sql, Object obj, String key, String value) throws Exception;
	
}
