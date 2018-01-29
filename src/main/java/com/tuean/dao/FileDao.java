package com.tuean.dao;

import com.tuean.model.File;

public interface FileDao {
	File save(File f);

	File getFileById(Integer fId);

	File getFileByCode(String fCode);

	void delete(Integer fId);
}
