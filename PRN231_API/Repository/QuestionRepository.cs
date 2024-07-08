using Microsoft.EntityFrameworkCore;
using PRN231_API.IRepository;
using PRN231_Library.Common;
using PRN231_Library.Models;
using PRN231_Library.Response;

namespace PRN231_API.Repository
{
    public class QuestionRepository : IQuestionRepository
    {
        private readonly Prn231FinalProjectContext DBcontext;

        public QuestionRepository(Prn231FinalProjectContext DBcontext)
        {
            this.DBcontext = DBcontext;
        }
        public async Task<ResultResponse<QuestionResponse>> GetAll(int typeId)
        {
            try
            {
                ResultResponse<QuestionResponse> response;

                var data = (from mq in this.DBcontext.MainQuestions
                            select new QuestionResponse
                            {
                                MainId = mq.MainId,
                                MainContent = mq.MainContent,
                                Image = mq.Images,
                                IsRequired = mq.IsRequired,
                                SubQuestions = (from sq in this.DBcontext.SubQuestions
                                                where sq.MainId == mq.MainId
                                                select new SubQuestionResponse
                                                {
                                                    IsCorrect = sq.IsAnswer,
                                                    SubContent = sq.SubContent,
                                                    SubsId = sq.SubId,
                                                }).ToList()
                            }).ToList();

                response = new ResultResponse<QuestionResponse>
                {
                    IsSuccessful = true,
                    Items = data.OrderBy(x => x.MainId).ToList(),
                };

                return response;
            }
            catch (Exception ex)
            {
                return new ResultResponse<QuestionResponse>
                {
                    IsSuccessful = false,
                    Message = ex.Message
                };
            }
        }

        public async Task<ResultResponse<TestResponse>> GetTest(int typeId)
        {
            try
            {
                ResultResponse<TestResponse> response;

                var data = (from mq in this.DBcontext.MainQuestions
                            select new TestResponse
                            {
                               MainId = mq.MainId,
                               MainContent = mq.MainContent,
                               Image = mq.Images,
                               IsRequired = mq.IsRequired,
                               SubQuestions = (from sq in this.DBcontext.SubQuestions
                                               where sq.MainId == mq.MainId
                                               select new SubQuestionResponse
                                               {
                                                   IsCorrect = sq.IsAnswer,
                                                   SubContent = sq.SubContent,
                                                   SubsId = sq.SubId,
                                               }).ToList()
                            })
                            .OrderBy(x => Guid.NewGuid() ) 
                            .Take(25) 
                            .ToList();

                response = new ResultResponse<TestResponse>
                {
                    IsSuccessful = true,
                    Items = data.OrderBy(x => x.MainId).ToList(),
                };

                return response;
            }
            catch (Exception ex)
            {
                return new ResultResponse<TestResponse>
                {
                    IsSuccessful = false,
                    Message = ex.Message
                };
            }
        }
    }
}
