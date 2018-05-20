package com.tuean.dao;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.tuean.model.File;
import com.tuean.util.ConstUtil;

@Repository
@Transactional
@Qualifier("fileDao")
public class FileDaoImpl extends GenericDao<File> implements FileDao, ConstUtil {

	@Override
	public File save(File f) {
		String sql = "INSERT INTO ta_file(code, name, extension, category_id, original_name, path, description) VALUES(?, ?, ?, ?, ?, ?, ?)";
		Object[] args = { f.getCode(), f.getName(), f.getExtension(), f.getCategory().getId(), f.getOriginal_name(),
				f.getPath(), f.getDescription() };
		executeQuery(sql, args);
		return null;
	}

	@Override
	public File getFileByCode(String fCode) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public File getFileById(Integer fId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void delete(Integer fId) {
		// TODO Auto-generated method stub

	}

}
