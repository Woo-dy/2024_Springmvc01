package com.ict.sns.vo;

public class kakaoUserResponse {
	private long id;
	private Properties properties;
	private String connectrd_at;
	private Kakao_account kakao_account;

	// get/set
	public Kakao_account getKakao_account() {
		return kakao_account;
	}

	public void setKakao_account(Kakao_account kakao_account) {
		this.kakao_account = kakao_account;
	}
	
	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public Properties getProperties() {
		return properties;
	}

	public void setProperties(Properties properties) {
		this.properties = properties;
	}

	public String getConnectrd_at() {
		return connectrd_at;
	}

	public void setConnectrd_at(String connectrd_at) {
		this.connectrd_at = connectrd_at;
	}



	public static class Properties {
		private String nickname;
		private String profile_image;
		
		// get/set
		public String getNickname() {
			return nickname;
		}
		public void setNickname(String nickname) {
			this.nickname = nickname;
		}
		public String getProfile_image() {
			return profile_image;
		}
		public void setProfile_image(String profile_image) {
			this.profile_image = profile_image;
		}
		
	}
	
	public static class Kakao_account {
		private String email;
		
		
		// get/set
		public String getEmail() {
			return email;
		}

		public void setEmail(String email) {
			this.email = email;
		}
		
//		private Profile profile;
//		
//		public static class Profile {
//			private String nickname;
//
//			// get/set
//		}
		
		
	}
	
}
