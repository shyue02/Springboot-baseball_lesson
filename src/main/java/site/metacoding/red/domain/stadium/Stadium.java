package site.metacoding.red.domain.stadium;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class Stadium {
	private Integer id;
	private String name;
	private Timestamp createdAt;
	
	// 엔티티가 아닌 필드
	private Integer no; //db에 없는 값을 엔티티에 직접 만들기도 한다
}
