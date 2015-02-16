<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Welcome extends CI_Controller {

	
	
	
	public function index()
	{
		//公司简介内容
		$this->db->select('title,content');
		$this->db->where('key','company_des');
		$query = $this->db->get("dili_u_m_page_data",1,0);
		$company_des = $query->result();
		$this->smarty->assign('company_des',$company_des[0]);
		
		
		
		
		//首页新闻中心标题列表
		$this->db->select('id,title');
		$query = $this->db->get("dili_u_m_article",5,0);
		$news = $query->result();	
		$this->smarty->assign('news',$news);
		
		
		//联系我们
		$this->db->select('title,content');
		$this->db->where('key','contact_us');
		$query = $this->db->get("dili_u_m_page_data",1,0);
		$contact_us = $query->result();
		$this->smarty->assign('contact_us',$contact_us[0]);
		
		
		
		
		$this->smarty->view('welcome.html');
	}
}

/* End of file welcome.php */
/* Location: ./application/controllers/welcome.php */