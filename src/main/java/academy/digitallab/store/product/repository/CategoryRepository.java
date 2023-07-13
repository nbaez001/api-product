package academy.digitallab.store.product.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import academy.digitallab.store.product.entity.Category;

public interface CategoryRepository extends JpaRepository<Category,Long> {
}
