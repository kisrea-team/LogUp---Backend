-- Create database
CREATE DATABASE IF NOT EXISTS logup;
USE logup;

-- Create projects table
CREATE TABLE IF NOT EXISTS projects (
    id INT(10) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    icon VARCHAR(10) NOT NULL,
    name VARCHAR(255) NOT NULL,
    latest_version VARCHAR(50) NOT NULL,
    latest_update_time DATE NOT NULL,
    describe TEXT,
    summar VARCHAR(255),
    author VARCHAR(100),
    type VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Create versions table
CREATE TABLE IF NOT EXISTS versions (
    id INT(10) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    project_id INT(10) UNSIGNED NOT NULL,
    version VARCHAR(50) NOT NULL,
    update_time DATE NOT NULL,
    content TEXT NOT NULL,
    download_url VARCHAR(500) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (project_id) REFERENCES projects(id) ON DELETE CASCADE,
    INDEX idx_project_id (project_id),
    INDEX idx_version (version)
);

-- Insert sample data
INSERT INTO projects (icon, name, latest_version, latest_update_time, describe, summar, author, type) VALUES
('🚀', 'Project Alpha', 'v2.1.0', '2024-01-15', '一个功能强大的项目管理工具，提供全面的项目跟踪和协作功能。', '高效的项目管理解决方案', 'Alpha Team', '工具'),
('⚡', 'Project Beta', 'v1.5.2', '2024-01-12', '快速响应的前端框架，专注于性能优化和用户体验。', '极速前端开发框架', 'Beta Corp', '框架'),
('🔧', 'Project Gamma', 'v3.0.1', '2024-01-14', '灵活的后端服务，支持多种数据库和微服务架构。', '多功能后端服务平台', 'Gamma Labs', '服务');

-- Insert sample versions for Project Alpha (id=1)
INSERT INTO versions (project_id, version, update_time, content, download_url) VALUES
(1, 'v2.1.0', '2024-01-15', '新增用户权限管理功能\n修复已知安全漏洞\n优化性能表现', 'https://example.com/download/v2.1.0'),
(1, 'v2.0.5', '2024-01-10', '修复登录问题\n更新依赖包\n改进UI界面', 'https://example.com/download/v2.0.5'),
(1, 'v2.0.0', '2024-01-01', '重大版本更新\n全新架构设计\n支持多语言', 'https://example.com/download/v2.0.0');

-- Insert sample versions for Project Beta (id=2)
INSERT INTO versions (project_id, version, update_time, content, download_url) VALUES
(2, 'v1.5.2', '2024-01-12', '性能优化\n修复内存泄漏\n新增API接口', 'https://example.com/download/beta-v1.5.2'),
(2, 'v1.5.1', '2024-01-08', '紧急修复\n安全补丁\n稳定性改进', 'https://example.com/download/beta-v1.5.1');

-- Insert sample versions for Project Gamma (id=3)
INSERT INTO versions (project_id, version, update_time, content, download_url) VALUES
(3, 'v3.0.1', '2024-01-14', '修复关键错误\n改进用户体验\n新增配置选项', 'https://example.com/download/gamma-v3.0.1');