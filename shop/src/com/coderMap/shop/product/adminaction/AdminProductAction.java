package cn.itcast.shop.product.adminaction;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import cn.itcast.shop.categorysecond.service.CategorySecondService;
import cn.itcast.shop.categorysecond.vo.CategorySecond;
import cn.itcast.shop.product.service.ProductService;
import cn.itcast.shop.product.vo.Product;
import cn.itcast.shop.utils.PageBean;

/*
 * 后台商品管理
 */
public class AdminProductAction extends ActionSupport implements ModelDriven<Product> {
	// 模型驱动使用的对象
	private Product product = new Product();

	@Override
	public Product getModel() {
		return product;
	}

	// 注入商品的Service
	private ProductService productService;

	public void setProductService(ProductService productService) {
		this.productService = productService;
	}
	//注入二级分类的service
	private CategorySecondService categorySecondService; 
	public void setCategorySecondService(CategorySecondService categorySecondService) {
		this.categorySecondService = categorySecondService;
	}

	// 接收page
	private Integer page; 
	public void setPage(Integer page) {
		this.page = page;
	}
	//文件上传需要的参数
	private File upload;//上传的文件
	private String uploadFileName;//接收文件上传的文件名
	private String uploadContextType;//文件长传的类型
	public void setUpload(File upload) {
		this.upload = upload;
	}
	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}
	public void setUploadContextType(String uploadContextType) {
		this.uploadContextType = uploadContextType;
	}
	// 带分页查询商品的执行方法
	public String findAll() {
		// 调用service查询
		PageBean<Product> pageBean = productService.findByPage(page);
		// 将数据传递到页面
		ActionContext.getContext().getValueStack().set("pageBean", pageBean);
		// 页面跳转
		return "findAll";
	}
	//跳转到添加页面
	public String addPage(){
		//查询所有二级分类的集合
		List<CategorySecond> csList=categorySecondService.findAll();
		//通过值栈保存数据
		ActionContext.getContext().getValueStack().set("csList", csList);
		//页面跳转
		return "addPageSuccess";
	}
	//保存商品的方法
	public String save() throws IOException{
		//调用service完成保存
		product.setPdate(new Date());
		if(upload!=null){
			//获得文件上传的磁盘的绝对路径
			String realpath=ServletActionContext.getServletContext().getRealPath("/products");
			//创建文件
			File diskFile=new File(realpath+"//"+uploadFileName);
			//文件上传
			FileUtils.copyFile(upload, diskFile);
			product.setImage("products/"+uploadFileName);
		}
		//将数据保存到数据库
		productService.save(product);
		//跳转页面
		return "saveSuccess"; 
	}
	//删除商品
	public String delete(){
		//先查询再删除
		product=productService.findByPid(product.getPid());
		//删除上传的图片
		//获得路径
		String path=product.getImage();
		if(path!=null){
			//获得磁盘绝对路径
			String realPath=ServletActionContext.getServletContext().getRealPath("/"+path);
			//文件对象
			File file=new File(realPath);
			//删除图片
			file.delete();
		}
		//删除上商品
		productService.delete(product);
		//页面跳转
		return "deleteSuccess"; 
	}
	//编辑商品的方法（跳转数据回显）
	public String edit(){
		//根据商品的id查询商品
		product=productService.findByPid(product.getPid());
		//查询商品所有的二级分类的集合
		List<CategorySecond> csList=categorySecondService.findAll();
		//将数据保存到页面（csList存入值栈）
		ActionContext.getContext().getValueStack().set("csList", csList);
		//页面跳转
		return "editSuccess";
	}
	//修改商品的方法
	public String update() throws IOException{
		product.setPdate(new Date());
		//文件上传
		if(upload!=null){
			//删除原来的图片
			//获得路径
			String path=product.getImage();
			File file=new File(ServletActionContext.getServletContext().getRealPath("/"+path));
			//删除原来的图片
			file.delete();
			//重新文件上传
			//获得文件上传的磁盘的绝对路径
			String realpath=ServletActionContext.getServletContext().getRealPath("/products");
			//创建文件
			File diskFile=new File(realpath+"//"+uploadFileName);
			//文件上传
			FileUtils.copyFile(upload, diskFile);
			product.setImage("products/"+uploadFileName);
		}
		//修改商品的数据到数据库
		productService.update(product);
		//页面跳转
		return "updateSuccess";
		
	}
}
