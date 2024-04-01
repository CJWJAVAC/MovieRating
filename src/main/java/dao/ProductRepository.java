package dao;

import java.util.ArrayList;

import dto.Product;

public class ProductRepository {

	private ArrayList<Product> listOfProducts = new ArrayList<Product>();
	private static ProductRepository instance = new ProductRepository();
	
	public static ProductRepository getInstance() {
		return instance;
	}
	
	public ProductRepository() {
		Product phone = new Product("P1234", "인터스텔라", 11000000);
		phone.setDescription("인류의 미래를 위해 우주를 탐험하는 영화");
		phone.setCategory("SF, 드라마");
		phone.setManufacturer("크리스토퍼 놀란");
		phone.setCondition("4");
		phone.setFilename("P12341.png");

		Product notebook = new Product("P1235", "트랜스포머", 7000000);
		notebook.setDescription("외계로봇과의 전쟁을 다룬 영화");
		notebook.setCategory("SF, 액션");
		notebook.setManufacturer("마이클 베이");
		notebook.setCondition("3");
		notebook.setFilename("P12351.png");

		Product tablet = new Product("P1236", "탑건:매버릭", 8000000);
		tablet.setDescription("오래전 은퇴한 공군 에이스의 이야기를 다룬 영화");
		tablet.setCategory("액션, 드라마");
		tablet.setManufacturer("조셉 코신스키");
		tablet.setCondition("4");
		tablet.setFilename("P12361.png");

		listOfProducts.add(phone);
		listOfProducts.add(notebook);
		listOfProducts.add(tablet);	
	}
	
	public ArrayList<Product> getAllProducts() {
		return listOfProducts;
	}	
	public void addProduct(Product product) {
		listOfProducts.add(product);
	}
	public Product getProductById(String productId) {
		Product productById = null;
		
		for(int i=0; i<listOfProducts.size(); i++) {
			Product product = listOfProducts.get(i);
			if(product!=null && product.getProductId()!=null && product.getProductId().equals(productId)) {
				productById = product;
				break;
			}
		}
		return productById;
	}
	}

