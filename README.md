# 🎓 Ruby on Rails Backend for Student Scores (PostgreSQL + PgAdmin)

This is a Ruby on Rails backend project for managing THPT exam scores. Data is imported from a CSV file into the `StudentScore` model. The backend uses PostgreSQL, and PgAdmin is recommended for viewing the database.

---

## ⚙️ Requirements

Please install the following tools:

- [Ruby](https://rubyinstaller.org/) – Ruby programming language
- [Rails](https://rubyonrails.org/) – install via terminal:

  ```bash
  gem install rails
  ```

- [PostgreSQL](https://www.postgresql.org/download/) – database system
- [PgAdmin](https://www.pgadmin.org/download/) – GUI for PostgreSQL
- [Bundler](https://bundler.io/) – dependency manager for Ruby

  ```bash
  gem install bundler
  ```
---

## 🚀 Getting Started

### 1. Clone the Repository

```bash
git clone https://github.com/minhtri2908/Test-BE-Ruby.git
cd Test-BE-Ruby
```

### 2. Install Dependencies

```bash
bundle install
```

---

## 🛠 Set Up Database

### 3. Configure `config/database.yml`

```yaml
default: &default
  adapter: postgresql
  encoding: unicode
  pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>

development:
  <<: *default
  database: your_project_development
  username: postgres
  password: your_pg_password
  host: localhost

test:
  <<: *default
  database: your_project_test
  username: postgres
  password: your_pg_password
  host: localhost
```

> 🔐 Replace `your_pg_password` with your actual PostgreSQL password.

### 4. Create the Model

Run the following commands to create the `StudentScore` model:

```bash
rails db:create

rails generate model StudentScore \
  sbd:string \
  toan:float ngu_van:float ngoai_ngu:float \
  vat_li:float hoa_hoc:float sinh_hoc:float \
  lich_su:float dia_li:float gdcd:float \
  ma_ngoai_ngu:string


rails db:migrate
```

---

## 📥 Import Data from CSV

### 5. Add your CSV file

Place your CSV file (e.g., `diem_thi_thpt_2024.csv`) in the `lib/seeds` folder.

### 6. Run the seed command

```bash
rails db:seed
```

---

## ▶️ Start the Server

```bash
rails server
```

Visit [http://localhost:3000](http://localhost:3000)

---

## 🐘 Connect PgAdmin to View Data

1. Open PgAdmin.
2. Right-click "Servers" → "Create" → "Server".
3. **General tab**: Name = `Local PostgreSQL`
4. **Connection tab**:
   - Host: `localhost`
   - Port: `5432`
   - Username: `postgres`
   - Password: `your_pg_password`
5. Expand the server and select `your_project_development`, then explore the `student_scores` table.

---

## 📂 Project Structure (Short)

```
app/
├──controllers/api/student_scores_controller.rb
├── models/student_score.rb
db/
├── migrate/
├── seeds.rb
lib/
├── seeds/diem_thi_thpt_2024.csv
```

---

# Demo link api: 

- Top 10 students in Group A (Math, Physics, Chemistry) [https://rails-thpt2024.onrender.com/api/student_scores/1234567](https://rails-thpt2024.onrender.com/api/student_scores/1234567)
