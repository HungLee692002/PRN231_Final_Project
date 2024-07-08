using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;

namespace PRN231_Library.Models;

public partial class Prn231FinalProjectContext : DbContext
{
    public Prn231FinalProjectContext()
    {
    }

    public Prn231FinalProjectContext(DbContextOptions<Prn231FinalProjectContext> options)
        : base(options)
    {
    }

    public virtual DbSet<Account> Accounts { get; set; }

    public virtual DbSet<MainQuestion> MainQuestions { get; set; }

    public virtual DbSet<Menu> Menus { get; set; }

    public virtual DbSet<MenuRole> MenuRoles { get; set; }

    public virtual DbSet<QuestionAnswer> QuestionAnswers { get; set; }

    public virtual DbSet<QuestionType> QuestionTypes { get; set; }

    public virtual DbSet<QuizzReport> QuizzReports { get; set; }

    public virtual DbSet<Role> Roles { get; set; }

    public virtual DbSet<SubQuestion> SubQuestions { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
    {
        var config = new ConfigurationBuilder().AddJsonFile("appsettings.json").Build().GetConnectionString("MyConStr");
        optionsBuilder.UseSqlServer(config);
    }

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Account>(entity =>
        {
            entity.HasKey(e => e.UserId);

            entity.ToTable("Account");

            entity.Property(e => e.UserId).HasColumnName("user_id");
            entity.Property(e => e.CreateDt).HasColumnName("create_dt");
            entity.Property(e => e.Dob).HasColumnName("dob");
            entity.Property(e => e.Email)
                .HasMaxLength(50)
                .HasColumnName("email");
            entity.Property(e => e.FirstName)
                .HasMaxLength(50)
                .HasColumnName("first_name");
            entity.Property(e => e.LastName)
                .HasMaxLength(50)
                .HasColumnName("last_name");
            entity.Property(e => e.Password)
                .HasMaxLength(50)
                .HasColumnName("password");
            entity.Property(e => e.RoleId).HasColumnName("role_id");
            entity.Property(e => e.UpdateDt).HasColumnName("update_dt");

            entity.HasOne(d => d.Role).WithMany(p => p.Accounts)
                .HasForeignKey(d => d.RoleId)
                .HasConstraintName("FK_Account_Role");
        });

        modelBuilder.Entity<MainQuestion>(entity =>
        {
            entity.HasKey(e => e.MainId);

            entity.ToTable("MainQuestion");

            entity.Property(e => e.MainId).HasColumnName("main_id");
            entity.Property(e => e.CreateDt).HasColumnName("create_dt");
            entity.Property(e => e.Images)
                .HasMaxLength(255)
                .HasColumnName("images");
            entity.Property(e => e.IsRequired).HasColumnName("is_required");
            entity.Property(e => e.MainContent)
                .HasMaxLength(255)
                .HasColumnName("main_content");
            entity.Property(e => e.TypeId).HasColumnName("type_id");
            entity.Property(e => e.UpdateDt).HasColumnName("update_dt");

            entity.HasOne(d => d.Type).WithMany(p => p.MainQuestions)
                .HasForeignKey(d => d.TypeId)
                .HasConstraintName("FK_MainQuestion_QuestionType");
        });

        modelBuilder.Entity<Menu>(entity =>
        {
            entity.ToTable("Menu");

            entity.Property(e => e.MenuId).HasColumnName("menu_id");
            entity.Property(e => e.Icon)
                .HasMaxLength(50)
                .HasColumnName("icon");
            entity.Property(e => e.Link)
                .HasMaxLength(50)
                .HasColumnName("link");
            entity.Property(e => e.Name)
                .HasMaxLength(50)
                .HasColumnName("name");
        });

        modelBuilder.Entity<MenuRole>(entity =>
        {
            entity.ToTable("MenuRole");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.MenuId).HasColumnName("menu_id");
            entity.Property(e => e.RoleId).HasColumnName("role_id");

            entity.HasOne(d => d.Menu).WithMany(p => p.MenuRoles)
                .HasForeignKey(d => d.MenuId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_MenuRole_Menu");

            entity.HasOne(d => d.Role).WithMany(p => p.MenuRoles)
                .HasForeignKey(d => d.RoleId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_MenuRole_Role");
        });

        modelBuilder.Entity<QuestionAnswer>(entity =>
        {
            entity.ToTable("QuestionAnswer");

            entity.Property(e => e.Id)
                .ValueGeneratedNever()
                .HasColumnName("id");
            entity.Property(e => e.CreateDt).HasColumnName("create_dt");
            entity.Property(e => e.MainId).HasColumnName("main_id");
            entity.Property(e => e.QuizzId).HasColumnName("quizz_id");
            entity.Property(e => e.SubId).HasColumnName("sub_id");
            entity.Property(e => e.UpdateDt).HasColumnName("update_dt");

            entity.HasOne(d => d.Main).WithMany(p => p.QuestionAnswers)
                .HasForeignKey(d => d.MainId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_QuestionAnswer_MainQuestion");

            entity.HasOne(d => d.Quizz).WithMany(p => p.QuestionAnswers)
                .HasForeignKey(d => d.QuizzId)
                .HasConstraintName("FK_QuestionAnswer_QuizzReport");

            entity.HasOne(d => d.Sub).WithMany(p => p.QuestionAnswers)
                .HasForeignKey(d => d.SubId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_QuestionAnswer_SubQuestion");
        });

        modelBuilder.Entity<QuestionType>(entity =>
        {
            entity.HasKey(e => e.TypeId);

            entity.ToTable("QuestionType");

            entity.Property(e => e.TypeId).HasColumnName("type_id");
            entity.Property(e => e.CreateDt).HasColumnName("create_dt");
            entity.Property(e => e.TimeLimit).HasColumnName("time_limit");
            entity.Property(e => e.TypeName)
                .HasMaxLength(255)
                .HasColumnName("type_name");
            entity.Property(e => e.UpdateDt).HasColumnName("update_dt");
        });

        modelBuilder.Entity<QuizzReport>(entity =>
        {
            entity.HasKey(e => e.QuizzId);

            entity.ToTable("QuizzReport");

            entity.Property(e => e.QuizzId).HasColumnName("quizz_id");
            entity.Property(e => e.CreateDt).HasColumnName("create_dt");
            entity.Property(e => e.Mark).HasColumnName("mark");
            entity.Property(e => e.Time).HasColumnName("time");
            entity.Property(e => e.UserId).HasColumnName("user_id");

            entity.HasOne(d => d.User).WithMany(p => p.QuizzReports)
                .HasForeignKey(d => d.UserId)
                .HasConstraintName("FK_QuizzReport_Account");

            entity.HasOne(d => d.Type).WithMany(p => p.QuizzReports)
                .HasForeignKey(d => d.TypeId)
                .HasConstraintName("FK_QuizzReport_QuestionType");
        });

        modelBuilder.Entity<Role>(entity =>
        {
            entity.ToTable("Role");

            entity.Property(e => e.RoleId).HasColumnName("role_id");
            entity.Property(e => e.RoleName)
                .HasMaxLength(50)
                .HasColumnName("role_name");
        });

        modelBuilder.Entity<SubQuestion>(entity =>
        {
            entity.HasKey(e => e.SubId);

            entity.ToTable("SubQuestion");

            entity.Property(e => e.SubId).HasColumnName("sub_id");
            entity.Property(e => e.CreateDt).HasColumnName("create_dt");
            entity.Property(e => e.IsAnswer).HasColumnName("is_answer");
            entity.Property(e => e.MainId).HasColumnName("main_id");
            entity.Property(e => e.SubContent)
                .HasMaxLength(255)
                .HasColumnName("sub_content");
            entity.Property(e => e.UpdateDt).HasColumnName("update_dt");

            entity.HasOne(d => d.Main).WithMany(p => p.SubQuestions)
                .HasForeignKey(d => d.MainId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_SubQuestion_MainQuestion");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
