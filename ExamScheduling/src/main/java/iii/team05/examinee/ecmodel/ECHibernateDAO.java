package iii.team05.examinee.ecmodel;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;



import iii.team05.hibernate.util.*;

public class ECHibernateDAO implements ECDao_interface{
	private static final String GET_ALL_STMT = "from ECVO order by ecno";
	@Override
	public void insert(ECVO examineeCatVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			session.saveOrUpdate(examineeCatVO);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
	}

	@Override
	public void update(ECVO examineeCatVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			session.saveOrUpdate(examineeCatVO);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		
	}

	@Override
	public void delete(String ecno) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			ECVO examineecatVO = (ECVO) session.get(ECVO.class, ecno);			
			session.delete(examineecatVO);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		
	}

	@Override
	public ECVO findByPrimaryKey(String ecno) {
		ECVO examineecatVO = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			examineecatVO = (ECVO) session.get(ECVO.class, ecno);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return examineecatVO;
	}

	@Override
	public List<ECVO> getAll() {
		List<ECVO> list = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			Query query = session.createQuery(GET_ALL_STMT);
			list = query.list();
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return list;
		
	}

}
