using Azure.Core;
using Microsoft.EntityFrameworkCore;
using PRN231_API.IRepository;
using PRN231_Library.Common;
using PRN231_Library.Models;
using PRN231_Library.Request;
using PRN231_Library.Response;

namespace PRN231_API.Repository
{
    public class QuizReportRepository : IQuizReportRepository
    {
        private readonly Prn231FinalProjectContext DBcontext;

        public QuizReportRepository(Prn231FinalProjectContext DBcontext)
        {
            this.DBcontext = DBcontext;
        }

        public async Task<ResultResponse<TestResultResponse>> GetResult(int userId)
        {
            try
            {
                ResultResponse<TestResultResponse> response;

                var maxA1 = await this.DBcontext.QuizzReports.OrderByDescending(q => q.Mark).FirstOrDefaultAsync(x => x.UserId == userId && x.TypeId == 1);

                var maxB1 = await this.DBcontext.QuizzReports.OrderByDescending(q => q.Mark).FirstOrDefaultAsync(x => x.UserId == userId && x.TypeId == 2);

                var data = new TestResultResponse
                {
                    MarkA1 = maxA1!.Mark ?? null,
                    MarkB1 = maxB1!.Mark ?? null,
                    quizzReports = await this.DBcontext.QuizzReports.Where(x => x.UserId == userId).ToListAsync(),
                };

                response = new ResultResponse<TestResultResponse>
                {
                    IsSuccessful = true,
                    Item = data,
                };

                return response;
            }
            catch (Exception ex)
            {
                return new ResultResponse<TestResultResponse>
                {
                    IsSuccessful = false,
                    Message = ex.Message
                };
            }
        }

        public async Task<ResultResponse<ResultDetailResponse>> GetDetail(int quizId)
        {
            try
            {
                ResultResponse<ResultDetailResponse> response;

                var data = (from pr in this.DBcontext.QuizzReports
                            where pr.QuizzId == quizId
                            select new ResultDetailResponse
                            {
                                QuizzId = quizId,
                                Mark = pr.Mark,
                                Time = pr.Time,
                                Questions = (from pr1 in this.DBcontext.QuizzReports
                                             join qa in this.DBcontext.QuestionAnswers on pr1.QuizzId equals qa.QuizzId
                                             join mq in this.DBcontext.MainQuestions on qa.MainId equals mq.MainId
                                             join sq in this.DBcontext.SubQuestions on qa.SubId equals sq.SubId
                                             where pr1.QuizzId == pr.QuizzId
                                             select new MainQuestionResponse
                                             {
                                                 MainId = mq.MainId,
                                                 MainContent = mq.MainContent,
                                                 Image = mq.Images,
                                                 SubId = sq.SubId,
                                                 SubContent = sq.SubContent,
                                                 IsCorrect = sq.IsAnswer,
                                             }).ToList()
                            }).FirstOrDefault();

                response = new ResultResponse<ResultDetailResponse>
                {
                    IsSuccessful = true,
                    Item = data,
                };

                return response;
            }
            catch (Exception ex)
            {
                return new ResultResponse<ResultDetailResponse>
                {
                    IsSuccessful = false,
                    Message = ex.Message
                };
            }
        }

        public async Task<RequestResponse> AddQuiz(QuizRequest req)
        {
            try
            {
                RequestResponse response;

                var mark = req.Questions.Where(x => x.IsCorrect == true).Count();

                var data = new QuizzReport
                {
                    Mark = mark,
                    CreateDt = DateTime.Now,
                    Time = req.Time,
                    TypeId = req.TypeId,
                    UserId = req.UserId,
                };

                await this.DBcontext.QuizzReports.AddAsync(data);

                await this.DBcontext.SaveChangesAsync();

                foreach(var item in req.Questions)
                {
                    var question = new QuestionAnswer
                    {
                        QuizzId = data.QuizzId,
                        MainId = item.MainId!.Value,
                        SubId = item.SubId!.Value,
                        CreateDt = DateTime.Now,
                        UpdateDt = DateTime.Now,
                    };

                    await this.DBcontext.QuestionAnswers.AddAsync(question);
                }

                await this.DBcontext.SaveChangesAsync();

                response = new RequestResponse
                {
                    IsSuccessful = true,
                    Message = "Test submit successfully",
                };

                return response;
            }
            catch (Exception ex)
            {
                return new RequestResponse
                {
                    IsSuccessful = false,
                    Message = ex.Message
                };
            }
        }
    }
}
