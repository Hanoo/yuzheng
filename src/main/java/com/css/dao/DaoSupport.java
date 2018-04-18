package com.css.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.util.List;

@Repository("daoSupport")
public class DaoSupport implements DAO {

    @Resource
    private SqlSessionTemplate sqlSessionTemplate;

    /**
     * 保存对象
     *
     * @param str
     * @param obj
     * @return
     * @throws Exception
     */
    public Object save(String str, Object obj) throws Exception {
        return sqlSessionTemplate.insert(str, obj);
    }

    /**
     * 批量更新
     *
     * @param str
     * @param objs
     * @return
     * @throws Exception
     */
    public Object batchSave(String str, List objs) throws Exception {
        return sqlSessionTemplate.insert(str, objs);
    }

    /**
     * 修改对象
     *
     * @param str
     * @param obj
     * @return
     * @throws Exception
     */
    public Object update(String str, Object obj) throws Exception {
        return sqlSessionTemplate.update(str, obj);
    }

    /**
     * 批量更新
     *
     * @param str
     * @param objs
     * @return
     * @throws Exception
     */
    public Object batchDelete(String str, List objs) throws Exception {
        return sqlSessionTemplate.delete(str, objs);
    }

    /**
     * 删除对象
     *
     * @param str
     * @param obj
     * @return
     * @throws Exception
     */
    public Object delete(String str, Object obj) throws Exception {
        return sqlSessionTemplate.delete(str, obj);
    }

    /**
     * 查找对象
     *
     * @param str
     * @param obj
     * @return
     * @throws Exception
     */
    public Object findForObject(String str, Object obj) throws Exception {
        Object object = null;
        try{
             object =  sqlSessionTemplate.selectOne(str, obj);
        }catch (Exception e){
            System.out.println(e.getMessage());
        }
        return object;
    }

    /**
     * 查找对象
     * @param str
     * @param obj
     * @return
     * @throws Exception
     */
    public Object findForList(String str, Object obj) throws Exception {
        return sqlSessionTemplate.selectList(str, obj);
    }

    public Object findForList(String statement, String string, Object parameter) {
        return sqlSessionTemplate.selectList(statement,string);
    }

    public Object findForMap(String str, Object obj, String key, String value) throws Exception {
        return sqlSessionTemplate.selectMap(str, obj, key);
    }

}


