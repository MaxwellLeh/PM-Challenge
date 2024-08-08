// const feedbackController = require("../../../controllers/feedbackController");
// const Feedback = require("../../../models/feedbackModel");

// const mockSend = jest.fn();
// const mockJson = jest.fn();
// const mockEnd = jest.fn();

// const mockStatus = jest.fn(() => ({
//   send: mockSend,
//   json: mockJson,
//   end: mockEnd,
// }));

// const mockRes = { status: mockStatus };

// describe("Feedback controller", () => {
//   beforeEach(() => jest.clearAllMocks());

//   afterAll(() => jest.resetAllMocks());

//   describe("index", () => {
//     it("should return feedback with a status code 200", async () => {
//       const testFeedback = [
//         {
//           feedback_id: 1,
//           role: "Student",
//           rating: 5,
//           comments: "App is easy to use",
//           improvement: "MORE COUNTRIES",
//           additional_comments: "Nothing",
//         },
//         {
//           feedback_id: 2,
//           role: "Student",
//           rating: 1,
//           comments: "I hate studying",
//           improvement: "Everything",
//           additional_comments: "Delete this",
//         },
//       ];
//       jest.spyOn(Feedback, "getAll").mockResolvedValue(testFeedback);

//       await feedbackController.index(null, mockRes);

//       expect(Feedback.getAll).toHaveBeenCalledTimes(1);
//       expect(mockStatus).toHaveBeenCalledWith(200);
//       expect(mockSend).toHaveBeenCalledWith({ data: testFeedback });
//     });

//     it("should return an error upon failure", async () => {
//       jest
//         .spyOn(Feedback, "getAll")
//         .mockRejectedValue(new Error("Something happened to your db"));

//       await feedbackController.index(null, mockRes);

//       expect(Feedback.getAll).toHaveBeenCalledTimes(1);
//       expect(mockStatus).toHaveBeenCalledWith(500);
//       expect(mockSend).toHaveBeenCalledWith({
//         error: "Something happened to your db",
//       });
//     });
//   });

//   describe("getFeedback", () => {
//     it("should return a single feedback with a 200 status", async () => {
//       const mockFeedback = {
//         feedback_id: 1,
//         role: "Student",
//         rating: 5,
//         comments: "App is easy to use",
//         improvement: "MORE COUNTRIES",
//         additional_comments: "Nothing",
//       };
//       jest.spyOn(Feedback, "showOneFeedback").mockResolvedValue(mockFeedback);

//       const req = { params: { id: 1 } };

//       await feedbackController.getFeedback(req, mockRes);

//       expect(Feedback.showOneFeedback).toHaveBeenCalledWith(1);
//       expect(mockStatus).toHaveBeenCalledWith(200);
//       expect(mockJson).toHaveBeenCalledWith(mockFeedback);
//     });

//     it("should return a 404 status and error message if feedback not found", async () => {
//       jest
//         .spyOn(Feedback, "showOneFeedback")
//         .mockRejectedValue(new Error("Feedback not found"));

//       const req = { params: { id: 1 } };

//       await feedbackController.getFeedback(req, mockRes);

//       expect(Feedback.showOneFeedback).toHaveBeenCalledWith(1);
//       expect(mockStatus).toHaveBeenCalledWith(404);
//       expect(mockJson).toHaveBeenCalledWith({ error: "Feedback not found" });
//     });
//   });

//   describe("create", () => {
//     it("should return a new feedback with a 201 status code", async () => {
//       let testFeedback = {
//         feedback_id: 1,
//         role: "Student",
//         rating: 5,
//         comments: "App is easy to use",
//         improvement: "MORE COUNTRIES",
//         additional_comments: "Nothing",
//       };
//       const mockReq = { body: testFeedback };

//       jest
//         .spyOn(Feedback, "create")
//         .mockResolvedValue(new Feedback(testFeedback));

//       await feedbackController.create(mockReq, mockRes);

//       expect(Feedback.create).toHaveBeenCalledTimes(1);
//       expect(mockStatus).toHaveBeenCalledWith(201);
//       expect(mockSend).toHaveBeenCalledWith({
//         data: new Feedback({ ...testFeedback }),
//       });
//     });

//     it("should return an error if creation fails", async () => {
//       let testFeedback = { name: "Test Feedback" };
//       const mockReq = { body: testFeedback };

//       jest.spyOn(Feedback, "create").mockRejectedValue(new Error("error"));

//       await feedbackController.create(mockReq, mockRes);

//       expect(Feedback.create).toHaveBeenCalledTimes(1);
//       expect(mockStatus).toHaveBeenCalledWith(400);
//       expect(mockSend).toHaveBeenCalledWith({ error: "error" });
//     });
//   });
// });
