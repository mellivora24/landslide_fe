Dưới đây là bản dịch tiếng Việt với văn phong chuyên nghiệp và mang tính học thuật hơn cho tài liệu README của dự án **Landslide Warning IoT App**:

---

# Ứng dụng IoT Giám sát và Cảnh báo Sạt lở Đất

![Flutter](https://img.shields.io/badge/Flutter-3.22.2-blue?logo=flutter) ![Dart](https://img.shields.io/badge/Dart-3.4.3-blue?logo=dart) ![License](https://img.shields.io/badge/License-MIT-green)

Ứng dụng di động đa nền tảng được phát triển bằng Flutter, tích hợp hệ thống IoT nhằm giám sát sạt lở đất theo thời gian thực. Ứng dụng hiển thị các điểm khảo sát trên bản đồ Google Maps, thu thập và phân tích dữ liệu môi trường (độ ẩm, lượng mưa, góc nghiêng) từ thiết bị cảm biến, tính toán mức độ rủi ro và cung cấp cơ chế cảnh báo. Đồng thời, hệ thống hỗ trợ quản trị viên quản lý các điểm khảo sát thông qua RESTful API bảo mật.

## Tính năng chính
- **Giám sát thời gian thực**: Thu nhận và hiển thị dữ liệu trực tiếp từ các thiết bị IoT thông qua giao thức MQTT.
- **Tích hợp Google Maps**: Hiển thị các điểm khảo sát dưới dạng marker (xanh: an toàn, đỏ: nguy hiểm) và biểu diễn vùng nguy cơ thông qua các đa giác (polygons).
- **Tính toán mức độ rủi ro**: Tự động phân loại nguy cơ sạt lở (Thấp / Trung bình / Cao) dựa trên các chỉ số cảm biến.
- **Quản lý hành chính**: Cho phép quản trị viên thực hiện các thao tác tạo mới, cập nhật, xoá điểm khảo sát thông qua API có xác thực bằng JWT.
- **Tìm kiếm nâng cao**: Hỗ trợ lọc và tìm kiếm điểm khảo sát theo ID hoặc mức độ nguy hiểm.

## Công nghệ sử dụng
- **Giao diện người dùng**: Flutter, Dart
- **Quản lý trạng thái**: `flutter_bloc`
- **Giao tiếp mạng**: `dio` (API RESTful), `mqtt_client` (dữ liệu thời gian thực)
- **Tuần tự hóa dữ liệu**: `json_serializable`

## Cấu trúc dự án
```
lib/
├── core/                    # Các thành phần dùng chung
│   ├── config/              # Cấu hình API & MQTT
│   ├── di/                  # Cấu hình GetIt
│   ├── errors/              # Xử lý ngoại lệ và lỗi
│   ├── network/             # Các lớp giao tiếp mạng
│   └── utils/               # Tiện ích xử lý (ví dụ: đánh giá nguy cơ)
├── features/                # Các mô-đun chức năng chính
│   ├── survey/              # Mô-đun quản lý điểm khảo sát
│   │   ├── data/            # Model dữ liệu, nguồn và repository
│   │   ├── domain/          # Các thực thể, interface và logic nghiệp vụ
│   │   └── presentation/    # Giao diện người dùng, màn hình, widget
│   ├── auth/                # Xác thực người dùng (quản trị viên)
│   └── search/              # Chức năng tìm kiếm
├── app.dart                 # Khởi tạo ứng dụng, cấu hình BLoC
└── main.dart                # Điểm khởi động chính
```

## Yêu cầu hệ thống
- **Flutter**: Phiên bản ≥ 3.22.2
- **Dart**: Phiên bản ≥ 3.4.3
- **Google Maps API Key**: Đăng ký tại [Google Cloud Console](https://console.cloud.google.com/)
- **MQTT Broker**: Máy chủ MQTT (ví dụ: Mosquitto) với topic `landslide/survey_data/{point_id}`
- **RESTful API**: Máy chủ backend hỗ trợ các endpoint như `/survey_points`, `/login`

## Hướng dẫn triển khai
1. **Sao chép mã nguồn**:
   ```bash
   git clone https://github.com/your-username/landslide-warning-iot.git
   cd landslide-warning-iot
   ```

2. **Cài đặt thư viện phụ thuộc**:
   ```bash
   flutter pub get
   ```

3. **Sinh mã tuần tự hóa (serialization)**:
   ```bash
   flutter pub run build_runner build --delete-conflicting-outputs
   ```

4. **Cấu hình API và MQTT**:
   Mở `lib/core/config/app_config.dart` và chỉnh sửa như sau:
   ```dart
   class AppConfig {
     static const String apiBaseUrl = 'https://your-api.com';
     static const String mqttBroker = 'broker.mqtt.com';
     static const String mqttTopicPrefix = 'landslide/survey_data/';
   }
   ```

5. **Cấu hình khóa API Google Maps**:
    - **Android**: Thêm vào `android/app/src/main/AndroidManifest.xml`:
      ```xml
      <meta-data
          android:name="com.google.android.geo.API_KEY"
          android:value="YOUR_API_KEY"/>
      ```
    - **iOS**: Thêm vào `ios/Runner/AppDelegate.swift`:
      ```swift
      GMSServices.provideAPIKey("YOUR_API_KEY")
      ```
