package com.glass.dao.file;



import com.glass.entity.file.SysFile;

import java.util.List;

/**
 * 文件相关
 * @author zhuzhou
 *
 */
public interface SysFileDao {

	int deleteByPrimaryKey(Integer id);

    int insert(SysFile record);

    int insertSelective(SysFile record);

    SysFile selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(SysFile record);

    int updateByPrimaryKey(SysFile record);
    
    SysFile selectByUUID(String uuid);
    
    List<SysFile> getListFile(SysFile sysfile);
}
