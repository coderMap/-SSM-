package cn.itcast.shop.cart.action;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import cn.itcast.shop.cart.vo.Cart;
import cn.itcast.shop.cart.vo.CartItem;
import cn.itcast.shop.product.service.ProductService;
import cn.itcast.shop.product.vo.Product;

/*
 * 购物车的action
 */
public class CartAction extends ActionSupport {
	// 接收pid
	private Integer pid;
	// 接收数量count
	private Integer count;
	// 注入商品的service
	private ProductService productService;

	public void setProductService(ProductService productService) {
		this.productService = productService;
	}

	public void setPid(Integer pid) {
		this.pid = pid;
	}

	public void setCount(Integer count) {
		this.count = count;
	}

	// 购物车添加到购物项
	public String addCart() {
		// 封装一个cartItem的对象
		CartItem cartItem = new CartItem();
		// 设置数量
		cartItem.setCount(count);
		// 根据商品id查询
		Product product = productService.findByPid(pid);
		// 设置商品
		cartItem.setProduct(product);
		// 将购物项添加到购物车
		// 购物车应该存到session中
		Cart cart = getCart();
		cart.addCart(cartItem);
		return "addCart";
	}
	//清空购物车执行的方法
	public String clearCart(){
		//获得cart对象
		Cart cart =getCart();
		//调用cart的clear方法
		cart.clearCart();
		return "clearCart";
		
	}
	//从购物车中移除购物相的方法
	public String removeCart(){
		//获得购物车的对象
		Cart cart=getCart();
		//调用购物车中移除的方法
		cart.removeCart(pid);
		return "removeCart";
	}
	//我的购物车执行方法
	public String myCart(){
		return "myCart";
	}

	/*
	 * 获得购物车的方法
	 */
	private Cart getCart() {
		// 从session中获得购物车
		Cart cart = (Cart) ServletActionContext.getRequest().getSession().getAttribute("cart");
		if (cart == null) {
			cart = new Cart();
			ServletActionContext.getRequest().getSession().setAttribute("cart", cart);
		}
		return cart;
	}

}
