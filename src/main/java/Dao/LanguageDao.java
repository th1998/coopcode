package Dao;

import java.util.List;

import Model.Programinglanguage;

public interface LanguageDao {
	List<Programinglanguage> getAllLanguage();
	int addLanguage(String language);
	int delLanguage(Integer id);
}
