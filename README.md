# CATFE - Hệ thống Quản lý Web Cat Cafe 

##  Tổng quan & Bài toán Doanh nghiệp
CATFE là một giải pháp số toàn diện được thiết kế để giải quyết bài toán vận hành thực tế cho mô hình cà phê thú cưng kết hợp cứu hộ. Hệ thống tập trung tối ưu hóa quy trình tương tác khách hàng trực tuyến, xử lý đặt vé tự động và quản lý thông tin dữ liệu tập trung.

###  Vai trò đảm nhiệm: Business Analyst (BA)
Chịu trách nhiệm chính trong việc chuyển hóa các nhu cầu thực tế thành các giải pháp hệ thống rõ ràng:
* **Thu thập & Phân tích yêu cầu:** Trực tiếp khảo sát hiện trạng và định hình các luồng nghiệp vụ lõi.
* **Mô hình hóa hệ thống:** Chuyển đổi yêu cầu thành ngôn ngữ kỹ thuật thông qua sơ đồ **Use Case** 
* **Quản lý dữ liệu:** Tham gia thiết kế cấu trúc Cơ sở dữ liệu logic, đảm bảo tính toàn vẹn thông tin.

###  Tech Stack & Kiến trúc
* **Mô hình:** MVC (Model - View - Controller).
* **Backend:** ASP.NET Core.
* **Database:** SQL Server.

#### 1. Phân quyền & Phạm vi Hệ thống (Use Case Diagram)
Định vị rõ ràng các quyền truy cập và ranh giới hệ thống giữa Khách hàng, Nhân viên và Quản trị viên (Admin).

#### 2. Quy trình Nghiệp vụ Chi tiết (Activity Diagram)
Mô phỏng tường tận các bước thao tác trên hệ thống để đảm bảo tính logic tuyệt đối trước khi tiến hành code.

###  Tư duy Phân tích & Đề xuất Cải tiến (Highlight)
Với góc nhìn của một BA nhằm tối ưu hóa hệ thống để phục vụ quản lý, tôi đã đề xuất các giải pháp nâng cấp sau:
* **Tối ưu Cơ sở dữ liệu:** Bổ sung trường dữ liệu `TicketType` (hoặc Purpose) vào bảng `Tickets` nhằm phân loại chính xác mục đích mua vé của khách. Điều này giải quyết bài toán làm báo cáo thống kê chuyên sâu cho cấp quản lý.
* **Nâng cao Trải nghiệm & Doanh thu:** Đề xuất tích hợp cổng thanh toán trực tuyến và module đánh giá cộng đồng (Rating) nhằm thúc đẩy sự tương tác cũng như nâng cao nguồn lực tài chính cho quỹ cứu hộ.

---

# Hệ thống Quản lý Vận chuyển

## Tổng quan đề tài
Đề tài nghiên cứu ứng dụng lý thuyết Hệ thống thông tin quản lý (MIS) nhằm xây dựng quy trình số hóa cho hoạt động vận tải hàng hóa đường bộ. Dự án giải quyết các bài toán then chốt: quản lý phương tiện vận chuyển, tài xế, tối ưu hóa tải trọng hàng hóa và hỗ trợ quy trình phân công chuyến hàng linh hoạt cho các doanh nghiệp vừa và nhỏ.

### Vai trò BA trong dự án:
 * Khảo sát hiện trạng chuỗi vận hành Logistics và xác định các điểm nghẽn của quy trình truyền thống.
 * Xác định, tổng hợp các yêu cầu chức năng (Functional Requirements) tối thiểu cần có cho một hệ thống thông tin quản lý vận tải.
 * Thiết lập luồng nghiệp vụ gợi ý và phân bổ phương tiện dựa trên thông số kỹ thuật tải trọng hàng hóa.

### Giải pháp & Kết quả đạt được
 * Số hóa các quy trình rời rạc từ khâu tiếp nhận đơn hàng, phân phối phương tiện tới hoàn tất giao nhận.
 * Giảm tải thời gian xử lý thủ công nhờ cơ chế tự động hóa gợi ý phương tiện vận tải tối ưu.

### Hướng phát triển trong tương lai (Next Steps)
    **Tích hợp Bản đồ số:** Ứng dụng API Google Maps để theo dõi tọa độ thực tế của xe và tự động hóa tính toán quãng đường tối ưu nhằm tiết kiệm nhiên liệu.
    **Hệ sinh thái di động (Mobile App):** Xây dựng ứng dụng riêng cho tài xế để cập nhật trạng thái trực tiếp tại hiện trường và ký nhận điện tử.
    **Thuật toán AI nâng cao:** Nghiên cứu áp dụng trí tuệ nhân tạo dự báo nhu cầu thị trường và tối ưu hóa lịch trình bảo trì định kỳ cho toàn bộ đội xe.

---
## Tài liệu Đính kèm
Toàn bộ báo cáo chi tiết (.pdf) được lưu trữ tại thư mục documents
