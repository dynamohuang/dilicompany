<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Welcome extends CI_Controller {
	
	private function view_common(){
		//联系我们
		$this->db->select('title,content');
		$this->db->where('key','contact_us');
		$query = $this->db->get("dili_u_m_page_data",1,0);
		$contact_us = $query->result();
		$this->smarty->assign('contact_us',$contact_us[0]);
		$this->smarty->view('common.html');
	}
	
	
	public function __construct(){
		parent::__construct();
		$this->smarty->assign('base_url',base_url());
		$this->smarty->assign('site_url',site_url());
	}
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
		$this->db->where('type','1');
		$query = $this->db->get("dili_u_m_article",5,0);
		$news = $query->result();	
		$this->smarty->assign('news',$news);
		
		//产品展示
		$this->db->select('id,title,dili_attachments.*');
		$this->db->where('dili_u_m_article.type','2');
		$this->db->from('dili_u_m_article');
		$this->db->join('dili_attachments','dili_attachments.content = dili_u_m_article.id');
		$this->db->limit(5,0);
		
		$query = $this->db->get();
		
		$products = $query->result();
		$this->smarty->assign('products',$products);
		
		//联系我们
		$this->db->select('title,content');
		$this->db->where('key','contact_us');
		$query = $this->db->get("dili_u_m_page_data",1,0);
		$contact_us = $query->result();
		$this->smarty->assign('contact_us',$contact_us[0]);
		$this->smarty->view('welcome.html');
	}
	public function intro(){
		
		//main_data
		$this->db->select('title,content');
		$this->db->where('key','intro');
		$query = $this->db->get("dili_u_m_cate_content",1,0);
		$intro = $query->result();
		$this->smarty->assign('main_data',$intro[0]);
		$this->smarty->assign('common_type','data');
		$this->view_common();
		
	}
	
	public function news_list(){
		
		//新闻列表
		$this->db->select('id,title,update_time');
		$this->db->where('type','1');
		$query = $this->db->get("dili_u_m_article",20,0);
		$lists = $query->result();
		foreach ($lists as $k=>$v){
			
			$lists[$k]->update_time = date('Y-m-d', $v->update_time);
		}
		$this->smarty->assign('lists',$lists);
		
		
		$this->smarty->assign('title','新闻中心');
		$this->smarty->assign('common_type','list');
		$this->view_common();
		
	}
	

	public function news_detail(){
		$id = $this->uri->segment(3);
		$from = $this->uri->segment(4);	 
		//首页新闻中心标题列表
		$this->db->select('title,article');
		$this->db->where('id',$id);
		$query = $this->db->get("dili_u_m_article",1,0);
		$news = $query->result();
        
		$data =new stdClass();
		if ($from == "product"){
			$data->title = "产品中心";
		}else{
			$data->title = "新闻中心";
		}
		$data->content = $news[0]->article;
		$this->smarty->assign('main_data',$data);
		$this->smarty->assign('common_type','data');
		$this->view_common();
	}

	public function join(){
		//main_data
		$this->db->select('title,content');
		$this->db->where('key','join');
		$query = $this->db->get("dili_u_m_cate_content",1,0);
		$join = $query->result();
		$this->smarty->assign('main_data',$join[0]);
		$this->smarty->assign('common_type','data');
		$this->view_common();
		
	} 
	public function contact(){
		//main_data
		$this->db->select('title,content');
		$this->db->where('key','contact');
		$query = $this->db->get("dili_u_m_cate_content",1,0);
		$contact = $query->result();
		$this->smarty->assign('main_data',$contact[0]);
		$this->smarty->assign('common_type','data');
		$this->view_common();
		
	}
}

/* End of file welcome.php */
/* Location: ./application/controllers/welcome.php */
